contract TestRepeatZero {
    receive() {
         let counter: Int = 0;
         repeat (0) {
             counter = counter + 1;
         }
         dump(counter);
         return;
    }
}
