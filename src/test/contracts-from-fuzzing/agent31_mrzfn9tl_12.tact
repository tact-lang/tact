contract Test {
    receive() {
        // Testing valid ascii compile-time function with a short string literal (<=32 bytes)
        let x: Int = ascii("Test"); // "Test" is 4 bytes
        dump(x);
    }
}
