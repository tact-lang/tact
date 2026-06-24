contract TestRepeatGood {
    receive() {
         let counter: Int = 1;
         repeat (5) {
             counter += counter;
         }
         dump(counter);
    }
}
