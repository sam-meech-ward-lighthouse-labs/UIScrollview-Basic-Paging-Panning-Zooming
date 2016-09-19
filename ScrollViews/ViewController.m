//
//  ViewController.m
//  ScrollViews
//
//  Created by Sam Meech Ward on 2016-09-19.
//  Copyright © 2016 meech-ward. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@property (strong, nonatomic) UIImageView *airPodsImageView;
@property (strong, nonatomic, readonly) NSArray<UIImage *> *iPhoneImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Uncomment one of these at a time for the different scrolling examples
//    [self setupPagingImages];
    [self setupPanningAndZoomingImage];
}

#pragma mark -
#pragma mark - Paging

/// Setup a paging scroll view of iphone images.
- (void)setupPagingImages {
    
    CGFloat imageYPosition = 0;
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.imageScrollView.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.imageScrollView.frame);
    
    for (UIImage *iPhoneImage in self.iPhoneImages) {
        
        UIImageView *iPhoneImageView = [[UIImageView alloc] initWithImage:iPhoneImage];
        
        iPhoneImageView.frame = CGRectMake(0, imageYPosition, scrollViewWidth, scrollViewHeight);
        iPhoneImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.imageScrollView addSubview:iPhoneImageView];
        
        imageYPosition += scrollViewHeight;
    }
    
    self.imageScrollView.contentSize = CGSizeMake(scrollViewWidth, scrollViewHeight*self.iPhoneImages.count);
    
    self.imageScrollView.pagingEnabled = YES;
    
}

- (NSArray<UIImage *> *)iPhoneImages {
    return @[
             [UIImage imageNamed:@"black"],
             [UIImage imageNamed:@"gold"],
             [UIImage imageNamed:@"jetblack"],
             [UIImage imageNamed:@"rosegold"],
             [UIImage imageNamed:@"silver"],
             ];
}

#pragma mark -
#pragma mark - Zooming and Panning

/// Setup a zooming and panning scroll view for the airpods image.
- (void)setupPanningAndZoomingImage {
    UIImage *airPodsImage = [UIImage imageNamed:@"airpods"];
    self.airPodsImageView = [[UIImageView alloc] initWithImage:airPodsImage];
    
    [self.imageScrollView addSubview:self.airPodsImageView];
    
    self.imageScrollView.contentSize = self.airPodsImageView.bounds.size;
    
    self.imageScrollView.minimumZoomScale = 0.5;
    self.imageScrollView.maximumZoomScale = 4.0;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.airPodsImageView;
}

@end
