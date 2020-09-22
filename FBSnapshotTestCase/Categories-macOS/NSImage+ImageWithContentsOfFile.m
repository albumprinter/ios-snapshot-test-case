//
//  NSImage+ImageWithContentsOfFile.m
//  FBSnapshotTestCase macOS
//
//  Created by Ivan Misuno on 12/03/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <FBSnapshotTestCase/NSImage+ImageWithContentsOfFile.h>

@implementation NSImage (ImageWithContentsOfFile)

+ (instancetype)imageWithContentsOfFile:(NSString *)imageFilePath {
  NSImage *image = [[NSImage alloc] initWithContentsOfFile:imageFilePath];

  // Need to set the size, the NSImage initaliser divides the size by 2 on a Retina system
  // Because of the known context of these images, we can safely assume them to have one bitmap representation.
  NSAssert([image.representations[0] isKindOfClass:[NSBitmapImageRep class]], @"Not a bitmap image");

  NSBitmapImageRep *bitmap = (NSBitmapImageRep *)image.representations[0];
  image.size = NSMakeSize(bitmap.pixelsWide, bitmap.pixelsHigh);
  return image;
}

@end
