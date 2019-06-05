//
//  ViewController.m
//  com.testad.applovin
//
//  Created by bing on 2019/6/5.
//  Copyright © 2019 bing. All rights reserved.
//

#import "ViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>


static int In = 0;
@interface ViewController ()<ALAdLoadDelegate,ALAdDisplayDelegate,ALAdRewardDelegate>
@property (nonatomic, strong) ALAd *ad;
@end

@implementation ViewController


- (void)loadInterstitialAd
{
    // Load an interstitial ad and be notified when the ad request is finished.
    [[ALSdk shared].adService loadNextAd: [ALAdSize sizeInterstitial] andNotify: self];
    
    [ALInterstitialAd shared].adLoadDelegate = self;
    [ALInterstitialAd shared].adDisplayDelegate = self;
    [ALInterstitialAd shared].adVideoPlaybackDelegate = self;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.AdState.text = @"";
}



- (IBAction)showAd:(id)sender {
    NSLog(@"show ad");
    self.AdState.text = [NSString stringWithFormat:@"%d",In++];
//    [[ALInterstitialAd shared] showAd:self.ad];
    [[ALInterstitialAd shared] showOver: [UIApplication sharedApplication].keyWindow andRender: self.ad];
//    [[ALInterstitialAd shared] showOver: [UIApplication sharedApplication].keyWindow andRender: self.ad];
}



#pragma mark - Ad Load Delegate

- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad
{
    // We now have an interstitial ad we can show!
    self.ad = ad;
    self.AdState.text = @"didLoadAd";
}

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    // Look at ALErrorCodes.h for the list of error codes.
    self.AdState.text = @"didFailToLoadAdWithError";
}


#pragma mark -  adVideoPlaybackDelegate

- (void)videoPlaybackBeganInAd:(ALAd *)ad{
    
}

/**
 * This method is invoked when a video stops playing in an ad.
 *
 * This method is invoked on the main UI thread.
 *
 * @param ad                Ad in which video playback ended.
 * @param percentPlayed     How much of the video was watched, as a percent.
 * @param wasFullyWatched   Whether or not the video was watched to, or very near to, completion.
 */
- (void)videoPlaybackEndedInAd:(ALAd *)ad atPlaybackPercent:(NSNumber *)percentPlayed fullyWatched:(BOOL)wasFullyWatched{
    
}



#pragma mark - ALAdDisplayDelegate

- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view{
    
}

/**
 * This method is invoked when the ad is hidden from in the view.
 * This occurs when the user "X's" out of an interstitial.
 *
 * This method is invoked on the main UI thread.
 *
 * @param ad     Ad that was just hidden. Will not be nil.
 * @param view   Ad view in which the ad was hidden. Will not be nil.
 */
- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view{
    
}

/**
 * This method is invoked when the ad is clicked from in the view.
 *
 * This method is invoked on the main UI thread.
 *
 * @param ad     Ad that was just clicked. Will not be nil.
 * @param view   Ad view in which the ad was hidden. Will not be nil.
 */
- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view{
    
}


#pragma mark -  ALAdRewardDelegate

- (void)rewardValidationRequestForAd:(ALAd *)ad didSucceedWithResponse:(NSDictionary *)response{
    NSLog
}

/**
 * This method will be invoked if we were able to contact AppLovin, but the user has already received
 * the maximum number of coins you allowed per day in the web UI.
 *
 *  @param ad       Ad which was viewed.
 *  @param response Dictionary containing response data from the server.
 */
- (void)rewardValidationRequestForAd:(ALAd *)ad didExceedQuotaWithResponse:(NSDictionary *)response {
    
}

/**
 * This method will be invoked if the AppLovin server rejected the reward request.
 * This would usually happen if the user fails to pass an anti-fraud check.
 *
 *  @param ad       Ad which was viewed.
 *  @param response Dictionary containing response data from the server.
 */
- (void)rewardValidationRequestForAd:(ALAd *)ad wasRejectedWithResponse:(NSDictionary *)response{
    
}

/**
 * This method will be invoked if were unable to contact AppLovin, so no ping will be heading to your server.
 *
 *  @param ad           Ad which was viewed.
 *  @param responseCode A failure code corresponding to a constant defined in <code>ALErrorCodes.h</code>.
 */
- (void)rewardValidationRequestForAd:(ALAd *)ad didFailWithError:(NSInteger)responseCode{
    
}

@end
