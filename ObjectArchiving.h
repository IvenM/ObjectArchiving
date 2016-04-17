//
//  ObjectArchiving.h
//  对象归档
//
//  Created by Iven on 16/4/17.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^Myblock ) (id objc);//回传对象给调用者
@interface ObjectArchiving : NSObject


//编码,传入要归档的对象，以及他的key值，为了以后可以解码，有一个key值,传入要保存文件的地址
+(void)encode:(id)objc withKeyName:(NSString*)keyName withFilePath:(NSString*)filePath;


//解码，传入要解码的文件路径，key值，然后回传一个对象给调用者
+(void)decodeWithFilePath:(NSString*)filePath withKeyName:(NSString*)keyName withBlock:(Myblock)block;


@end
