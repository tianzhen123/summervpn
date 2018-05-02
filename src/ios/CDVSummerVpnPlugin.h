//
//  CDVSummerVpnPlugin.h
//  vpn
//
//  Created by jiangzhenya on 2017/11/10.
//

#import <Cordova/CDV.h>
#import "SangforAuthManager.h"

@interface CDVSummerVpnPlugin : CDVPlugin<SangforAuthDelegate>
-(void)connectVPN:(CDVInvokedUrlCommand *)command;
-(void)onLoginSuccess;
-(void)onLoginFailed:(NSError *)error;
- (void)onLoginProcess:(VPNAuthType)nextAuthType message:(BaseMessage *)msg;
@end
