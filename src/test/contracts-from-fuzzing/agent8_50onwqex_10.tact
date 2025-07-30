contract Test {
    receive() {
         // Testing while loop: decrement x until 0
         let x: Int = 10;
         while (x > 0) {
             x = x - 1;
         }
         dump(x);
    }
}
