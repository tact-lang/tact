contract DebugMixedTest {
    receive() {
         dump(5);
         dump(false);
         dump(null);
         dump("Hello world");
         dump(emptyCell());
         dump(emptySlice());
         dump(beginCell());
    }
}
