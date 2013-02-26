//
//  CustomSectionIndex.m
//
//  Created by Javi on 14/12/12.
//  Copyright (c) 2012 Javi. All rights reserved.
//

#import "CustomSectionIndex.h"

@implementation CustomSectionIndex


- (id)init {
    
    _sectionIndexFont = [UIFont fontWithName: @"HelveticaNeue-Bold" size: 9];

    UIImage *backgroundImage = [[UIImage imageNamed: @"IndexTableBackground.png"] resizableImageWithCapInsets: UIEdgeInsetsMake(18, 20, 18, 20)];
    
    _indexArray = [NSMutableArray arrayWithObjects: @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"Ñ",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    // Calculamos cuánto ocupa cada letra para calcular el tamaño total
    letterSize = [[_indexArray lastObject] sizeWithFont: _sectionIndexFont];
    
    // El alto será tantas veces el tamaño de una letra por las letras totales.
    self = [super initWithFrame: CGRectMake(0, 0, backgroundImage.size.width, (letterSize.height * [_indexArray count]) + 8)];
    
    if (self) {
                
        sectionIndexBackground = [[UIImageView alloc] initWithFrame: self.frame];
        sectionIndexBackground.image = backgroundImage;
        
        [self addSubview: sectionIndexBackground];
        
        [self createInitialData];
    
    }
    
    return self;
}


- (void) createInitialData {
    
    float init = 4;
    int tag = 1;
    
    for (NSString *letter in _indexArray) {
        
        UILabel *letterLabel = [[UILabel alloc] initWithFrame: CGRectMake(4, init, self.frame.size.width - 8, letterSize.height)];
        letterLabel.font = _sectionIndexFont;
        letterLabel.textColor = [UIColor colorWithRed:106/255.0 green:115/255.0 blue:125/255.0 alpha:1.0];
        letterLabel.backgroundColor = [UIColor clearColor];
        letterLabel.textAlignment = UITextAlignmentCenter;
        letterLabel.text = letter;
        letterLabel.userInteractionEnabled = YES;
        letterLabel.tag = tag++;
        
        [self addSubview: letterLabel];
        
        init += letterLabel.frame.size.height;
    }
    
}


#pragma mark - UIResponder methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: self];
    [self getSectionTouched: location];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: self];
    [self getSectionTouched: location];
    
}


#pragma mark - Other methods

// Calculamos la sección en la que hemos tocado
- (void) getSectionTouched: (CGPoint) touched {
    
    int sectionTouched = -1;
    
    if (touched.x > 4 && touched.x < 24 && touched.y > 4 && touched.y < (self.frame.size.height-8) ) {
        
        sectionTouched = (touched.y - 5) / letterSize.height;
        
    }
    
    if (sectionTouched != -1) {
        [_delegate customSectionIndex:self withNewSection: sectionTouched andLetter: [_indexArray objectAtIndex: sectionTouched]];
    } else {
        [_delegate customSectionIndex:self withNewSection: sectionTouched andLetter: [NSString string]];
    }
    
}



@end
