contract TestRepeatNegative {
    receive() {
         let counter: Int = 0;
         repeat (-5) {
             counter = counter + 1;
         }
         dump(counter);
         return;
    }
}
