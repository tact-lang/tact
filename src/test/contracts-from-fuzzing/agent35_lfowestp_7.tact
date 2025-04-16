contract Test {
    // Using compile-time ascii function in a constant
    const S: Int = ascii("Hello");

    receive() {
        dump(self.S);
    }
}
