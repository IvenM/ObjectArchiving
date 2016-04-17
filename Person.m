//
//  Person.m
//  对象归档
//
//  Created by Iven on 16/4/17.
//  Copyright © 2016年 Iven. All rights reserved.
//

#import "Person.h"

@implementation Person


//编码协议
-(void)encodeWithCoder:(NSCoder *)aCoder{

    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
}

//解码协议
-(id)initWithCoder:(NSCoder *)aDecoder{
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.sex = [aDecoder decodeObjectForKey:@"sex"];
    
    return self;

}
@end
