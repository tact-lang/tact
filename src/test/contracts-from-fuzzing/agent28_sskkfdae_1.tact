contract TestAscii() {
    // Getter returning the computed ascii value of the lightning bolt emoji
    // Expected value: 14850721 (as per documentation example)
    get fun value() : Int {
        return ascii("⚡");
    }
}
