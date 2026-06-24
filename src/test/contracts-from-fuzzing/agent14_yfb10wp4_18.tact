contract TestSubtractionWithNegate {
    receive() {
         dump(5 - -5); // Expected output: 10
    }
}
