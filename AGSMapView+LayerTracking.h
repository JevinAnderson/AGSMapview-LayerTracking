/**
 A category which swizzles the map layer methods in order to partially add KVO compliance to AGSMapView's mapLayers property
 @see #AGSMapView#mapLayers
 
 You can observe the changes by observerving the key: kMapLayers
*/
 
#import <ArcGIS/ArcGIS.h>

extern NSString *kMapLayers;

@interface AGSMapView (LayerTracking)

@end
