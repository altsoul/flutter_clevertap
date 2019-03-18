#import "ClevertapPlugin.h"
#import "CleverTap.h"

@implementation ClevertapPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    ClevertapPlugin *plugin = [ClevertapPlugin new];
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"in.altsoul/clevertap" binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:plugin channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)flutterResult {
    NSLog(@"%@", call.method);
}
@end
