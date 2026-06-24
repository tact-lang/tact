contract TestBinaryAdditionSubtraction {
    receive() {
         let sum: Int = 10 + 5;
         let diff: Int = 10 - 5;
         dump(sum);
         dump(diff);
    }
}
