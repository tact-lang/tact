contract Test {
    receive() {}

    get fun test(): Int {
        let value: Int = 5;
        value += 10;   // Augmented addition
        return value;  // Expected output: 15
    }
}
