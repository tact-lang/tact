contract TestEmptyBlock {
    receive() {
         { }  // empty block
         dump(1);
    }
}
