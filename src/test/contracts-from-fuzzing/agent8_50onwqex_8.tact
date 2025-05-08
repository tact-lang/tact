contract Test {
    receive() {
         // Testing 'repeat' loop with negative iterations (should result in 0 iterations)
         let count: Int = 0;
         repeat (-1) {
             count = count + 1;
         }
         dump(count);
    }
}
