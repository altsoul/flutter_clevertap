#import "ScannerPlugin.h"
#import "DYQRCodeDecoderViewController.h"
//#import <scanner/scanner-Swift.h>

@implementation ScannerPlugin

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)flutterResult {
    UIViewController *rvc = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    DYQRCodeDecoderViewController *vc = [[DYQRCodeDecoderViewController alloc] initWithCompletion:^(BOOL succeeded, NSString *result) {
        if (succeeded) {
            flutterResult(result);
//            [flutterResult success: result];
            NSLog(@"Scanned vendor ID: %@", result);
        } else {
            // todo: implement error handling in case the user refused the camera permission
            NSLog(@"Failed to scan");
        }
    }];
    [vc setTitle:@"Altsoul"];
    [vc setNeedsScanAnnimation:YES];
    
//    [[vc leftBarButtonItem] setImage:[UIImage imageNamed:@"your image name"]];
//    [[vc rightBarButtonItem] setImage:[UIImage imageNamed:@"your image name"]];
    //or
//    [[vc leftBarButtonItem] setTitle:@"string"];
//    [[vc leftBarButtonItem] setTitle:@"string"];
    
    [vc setNavigationBarTintColor:[UIColor lightGrayColor]];
    
//    [vc setFrameImage:[UIImage imageNamed:@"your image name"]];
//    [vc setLineImage:[UIImage imageNamed:@"your image name"]];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
//    rvc presentViewController:nav animated:<#(BOOL)#> completion:<#^(void)completion#>
    [rvc presentViewController:navVC animated:YES completion:NULL];
    
}


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    ScannerPlugin *plugin = [ScannerPlugin new];
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"scanner" binaryMessenger:[registrar messenger]];
    [registrar addMethodCallDelegate:plugin channel:channel];
}
@end
