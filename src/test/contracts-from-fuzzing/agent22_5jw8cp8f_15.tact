contract TestRepeatCorrect {
    receive() {
         let x: Int = 1;
         repeat (3) {
             x = x * 2;
         }
         dump(x);
    }
}
