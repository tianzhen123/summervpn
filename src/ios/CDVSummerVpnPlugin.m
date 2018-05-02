//
//  CDVSummerVpnPlugin.m
//  vpn
//
//  Created by jiangzhenya on 2017/11/10.
//

#import "CDVSummerVpnPlugin.h"
@interface CDVSummerVpnPlugin()
@property (nonatomic, retain) SangforAuthManager *sdkManager;
@property (nonatomic,strong) CDVInvokedUrlCommand *myCommand;
@end
@implementation CDVSummerVpnPlugin
-(void)connectVPN:(CDVInvokedUrlCommand *)command{
    self.myCommand = command;
    NSDictionary *params = [command.arguments objectAtIndex:0];
    NSString *url = params[@"url"];
    NSString *userName = params[@"username"];
    NSString *password = params[@"password"];
    if (![url isEqualToString:@""] && ![userName isEqualToString:@""] && ![password isEqualToString:@""]) {
        _sdkManager = [SangforAuthManager getInstance];
        _sdkManager.delegate = self;
        NSURL *vpnUrl = [NSURL URLWithString:url];
        [_sdkManager startPasswordAuthLogin:VPNModeEasyApp vpnAddress:vpnUrl username:userName password:password];
    }else{
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:@{@"code":@"0",@"error_msg":@"请填写完整信息"}] callbackId:command.callbackId];
    }
}

-(void)onLoginSuccess{
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:@{@"code":@"1",@"msg":@"连接成功"}] callbackId:self.myCommand.callbackId];
}
-(void)onLoginFailed:(NSError *)error{
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:@{@"code":@"0",@"error_msg":error.domain?:@"连接失败"}] callbackId:self.myCommand.callbackId];
}
- (void)onLoginProcess:(VPNAuthType)nextAuthType message:(BaseMessage *)msg{
    
}

@end
