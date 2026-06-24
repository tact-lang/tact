contract TestBitwiseNot {
    receive() {
         dump(~42);        // Expected: -43
         dump(~(~42));     // Expected: 42
    }
}
