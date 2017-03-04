//
//  DebugAndRelease.h
//  7dmallStore
//
//  Created by LiJie on 15/12/30.
//  Copyright © 2015年 celink. All rights reserved.
//

#ifndef DebugAndRelease_h
#define DebugAndRelease_h



#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%@: (%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
//#define NSLog(...)
#define DLog( s, ... )
#endif


#endif /* DebugAndRelease_h */
