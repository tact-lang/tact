contract Test {
    receive() {
         // Testing throwIf statement where condition is false
         throwIf(200, false);
         dump(10);
    }
}
