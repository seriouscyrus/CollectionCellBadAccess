# CollectionCellBadAccess
Demo project showing annoying behaviour with progress views in collection view cells.

Basically, I have an object that updates it's own property with progress (ProgressObject).

I want to show the progress of that object in it's cell in the collection view (ProgressCollectionViewCell).

In the collection view cell, I have a property to store my object (progressObject).

The setter for the property is modified to add and remove observers to the property I want to display for the cell.

Then finally in the observeValue: method, I update the progress view.

This works fine, unitl you move away from the view.  If you go back using the navigation controller, the app crashes trying to update the progressView

I want to try and determine either, how to detect if the progress view is valid, or add and remove the observers in a smart way.

I've figured a work around in unsetting the progressObjects in the viewWillDisappear method, but this seems less than ideal.  It seems to work, until you navigate the other way, selecting a cell to move to the last view controller, then going back through navigation, then all my cells have lost their objects.  So now I would have to update all my cells in the viewWillAppear method too. In a real situation, many other aspects of the cell may be configured, that are usually handled with the collectionview cellForItemAtIndexPath method.
