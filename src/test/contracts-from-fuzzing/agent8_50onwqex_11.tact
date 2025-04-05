contract Test {
    receive() {
         // Testing do...until loop: decrement x until x <= 0
         let x: Int = 10;
         do {
             x = x - 1;
         } until (x <= 0);
         dump(x);
    }
}
