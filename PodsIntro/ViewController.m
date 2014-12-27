//
//  ViewController.m
//  PodsIntro
//
//  Created by Scott Sirowy on 12/27/14.
//  Copyright (c) 2014 Scott Sirowy. All rights reserved.
//

#import "ViewController.h"
#import <ArcGIS/ArcGIS.h>

@interface ViewController () <AGSMapViewTouchDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AGSMapView* mapView = [[AGSMapView alloc] initWithFrame:self.view.bounds];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:mapView];
    
    //Add a basemap tiled layer
    NSURL* url = [NSURL URLWithString:@"http://services.arcgisonline.com/arcgis/rest/services/NatGeo_World_Map/MapServer"];
    AGSTiledMapServiceLayer *tiledLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL:url];
    [mapView addMapLayer:tiledLayer withName:@"Basemap Tiled Layer"];
    
    AGSEnvelope* redlands = [AGSEnvelope envelopeWithXmin:-13046781.151300
                                                     ymin:4032015.796770
                                                     xmax:-13042560.702336
                                                     ymax:4039522.568662
                                         spatialReference:mapView.spatialReference];
    [mapView zoomToEnvelope:redlands animated:YES];
}

@end
