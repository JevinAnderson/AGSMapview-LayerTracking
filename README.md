# AGSMapview-LayerTracking
An implementation of a category which allows for partial KVO compliance on the mapLayers property of AGSMapView

While working on a project I was looking for a way to observe layer additions or subtractions from the AGSMapView similar to the 'layer-add' and 'layer-remove' events in the JavaScript api.

I didn't find any, so I reached out and found Nicholas Furness' Layer loading repo. 

https://github.com/nixta/layerloading-plugin-ios

I modified his example to use partial KVO compliance instead of NSNotifications, and have been slightly more complete.
