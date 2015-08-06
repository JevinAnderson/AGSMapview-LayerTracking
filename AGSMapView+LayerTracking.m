#import <objc/runtime.h>

#import "AGSMapView+LayerTracking.h"

NSString *kMapLayers = @"mapLayers";

//Inspired by https://github.com/nixta/layerloading-plugin-ios/blob/master/layerloading-plugin-ios/NXTLayerLoading/AGSMapView%2BLayerLoading.m

@implementation AGSMapView (LayerTracking)

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Swap some methods around...
        Class myClass = [self class];
        Method a = nil; Method b = nil;
        
        // Swap add layer methods
        a = class_getInstanceMethod(myClass, @selector(addMapLayer:));
        b = class_getInstanceMethod(myClass, @selector(Jevins_LayerTracking_addMapLayer:));
        method_exchangeImplementations(a, b);
        
        a = class_getInstanceMethod(myClass, @selector(addMapLayer:withName:));
        b = class_getInstanceMethod(myClass, @selector(Jevins_LayerTracking_addMapLayer:withName:));
        method_exchangeImplementations(a, b);
        
        // Swap insert layer methods
        a = class_getInstanceMethod(myClass, @selector(insertMapLayer:atIndex:));
        b = class_getInstanceMethod(myClass, @selector(Jevins_LayerTracking_insertMapLayer:atIndex:));
        method_exchangeImplementations(a, b);
        
        a = class_getInstanceMethod(myClass, @selector(insertMapLayer:withName:atIndex:));
        b = class_getInstanceMethod(myClass, @selector(Jevins_LayerTracking_insertMapLayer:withName:atIndex:));
        
        // Swap remove layer methods
        a = class_getInstanceMethod(myClass, @selector(removeMapLayer:));
        b = class_getInstanceMethod(myClass, @selector(Jevins_LayerTracking_removeMapLayer:));
        method_exchangeImplementations(a, b);
        
        a = class_getInstanceMethod(myClass, @selector(removeMapLayerWithName:));
        b = class_getInstanceMethod(myClass, @selector(Jevins_LayerTracking_removeMapLayerWithName:));
        method_exchangeImplementations(a, b);
    });
}

#pragma mark - Replacement (swizzled) methods

// Add layers
-(void)Jevins_LayerTracking_addMapLayer:(AGSLayer *)mapLayer
{
    [self willChangeValueForKey:kMapLayers];
    
    [self Jevins_LayerTracking_addMapLayer:mapLayer];
    
    [self didChangeValueForKey:kMapLayers];
}

-(void)Jevins_LayerTracking_addMapLayer:(AGSLayer *)mapLayer withName:(NSString *)name
{
    [self willChangeValueForKey:kMapLayers];
    
    [self Jevins_LayerTracking_addMapLayer:mapLayer withName:name];
    
    [self didChangeValueForKey:kMapLayers];
}

// Insert Layers
-(void)Jevins_LayerTracking_insertMapLayer:(AGSLayer *)lyr atIndex:(NSInteger)index
{
    [self willChangeValueForKey:kMapLayers];
    
    [self Jevins_LayerTracking_insertMapLayer:lyr atIndex:index];
    
    [self didChangeValueForKey:kMapLayers];
}

-(void)Jevins_LayerTracking_insertMapLayer:(AGSLayer *)mapLayer withName:(NSString *)name atIndex:(NSUInteger)index
{
    [self willChangeValueForKey:kMapLayers];
    
    [self Jevins_LayerTracking_insertMapLayer:mapLayer withName:name atIndex:index];
    
    [self didChangeValueForKey:kMapLayers];
}

//Remove layers

-(void)Jevins_LayerTracking_removeMapLayer:(AGSLayer *)mapLayer
{
    [self willChangeValueForKey:kMapLayers];
    
    [self Jevins_LayerTracking_removeMapLayer:mapLayer];
    
    [self didChangeValueForKey:kMapLayers];
}

-(void)Jevins_LayerTracking_removeMapLayerWithName:(NSString *)name
{
    [self willChangeValueForKey:kMapLayers];
    
    [self Jevins_LayerTracking_removeMapLayerWithName:name];
    
    [self didChangeValueForKey:kMapLayers];
}

@end
