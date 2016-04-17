//
//  ObjectArchiving.m
//  对象归档
//
//  Created by Iven on 16/4/17.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import "ObjectArchiving.h"
#import "Person.h"

@implementation ObjectArchiving


+(void)encode:(id)objc withKeyName:(NSString*)keyName withFilePath:(NSString*)filePath{

    /*
     1.准备归档的对象
     2.准备一个NSMutableData实例对象，来存储归档后的数据
     3.初始化归档的工具类
     4.归档对象
     5.结束归档-----归档的数据完成了存储
     6.写入文件
     */
    
    //1.归档的对象由objc传入。
    
    //2.NSMutableData实例对象
    NSMutableData *data = [[NSMutableData alloc]init];

    //3.初始化归档的工具类
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    
    //4.归档对象
    [archiver encodeObject:objc forKey:keyName];
    
    //5.结束归档
    [archiver finishEncoding];
    
    //6.写入文件
    
    NSString *path = [NSString stringWithFormat:@"/Documents/%@",filePath];
    
    NSString *file = [NSHomeDirectory() stringByAppendingString:path];
    
    [data writeToFile:file atomically:YES];
    
    NSLog(@"%@",file);

}


+(void)decodeWithFilePath:(NSString*)filePath withKeyName:(NSString*)keyName withBlock:(Myblock)block{

/*
 1.获取归档文件路径
 2.加载归档文件
 3.初始化解档的工具类----->传入要解档的data数据
 4.执行解档，通过key值
 5.结束解档
 */
    
    
    //1.获取文件路径，传入
    NSString *path = [NSString stringWithFormat:@"/Documents/%@",filePath];
    
    NSString *file = [NSHomeDirectory() stringByAppendingString:path];
    
    //2.加载归档文件
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    //3.执行解档的工具类
    NSKeyedUnarchiver *archiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    //4.执行解档
    id objc = [archiver decodeObjectForKey:keyName];
    
    //回调
    block(objc);

    //5.结束解档
    [archiver finishDecoding];

}

@end
