//
//  DLNativeModule.m
//  aihehuo_chat
//
//  Created by David on 2019/3/5.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "DLNativeModule.h"

@implementation DLNativeModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getLocalImagePath:(RCTResponseSenderBlock)callBack) {
  UIImage *image = [UIImage imageNamed:@"iPhone"];
  NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"LocalImage"];
  NSString *filePathNoExtension = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"image"]];
  
  NSString *filePathWithExtension = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"iPhone.png"]];
  
  
  [[NSFileManager defaultManager] createDirectoryAtPath:[filePathNoExtension stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
  
  [[NSFileManager defaultManager] createDirectoryAtPath:[filePathWithExtension stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
  
  
  
  NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
  
  BOOL filePathNoExtensionSuccessed = [imageData writeToFile:filePathNoExtension atomically:YES];
  BOOL filePathWithExtensionSuccessed = [imageData writeToFile:filePathWithExtension atomically:YES];
  

  // pathImage has image
  UIImage *noExtensionImage = [UIImage imageWithContentsOfFile:filePathNoExtension];
  UIImage *WithExtensionImage = [UIImage imageWithContentsOfFile:filePathWithExtension];
  
  callBack(@[filePathNoExtension, filePathWithExtension]);

}

@end
