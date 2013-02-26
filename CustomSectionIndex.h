//
//  CustomSectionIndex.h
//
//  Created by Javi on 14/12/12.
//  Copyright (c) 2012 Javi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSectionIndexDelegate;

@interface CustomSectionIndex : UIView {
    
    UIImageView *sectionIndexBackground;
    
    CGSize letterSize;
    
}

@property (strong, nonatomic) NSMutableArray *indexArray;
@property (strong, nonatomic) UIFont *sectionIndexFont;
@property (weak, nonatomic) id<CustomSectionIndexDelegate> delegate;

@end

@protocol CustomSectionIndexDelegate <NSObject>

- (void) customSectionIndex: (CustomSectionIndex *) customSection withNewSection: (int) section andLetter: (NSString*) selectedIndex;

@end
