//
//  Person.h
//  对象归档
//
//  Created by Iven on 16/4/17.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *sex;

@end
