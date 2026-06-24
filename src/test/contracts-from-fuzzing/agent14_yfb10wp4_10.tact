contract TestPrecedence {
    receive() {
         dump((1 + 2) * 3); // Expected output: 9
    }
}
