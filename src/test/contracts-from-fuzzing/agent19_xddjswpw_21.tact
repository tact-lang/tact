contract Test {
    receive() {
        // "Hello" is 5 bytes = 40 bits.
        // Attempting to load 41 bits should cause a Cell underflow at runtime according to docs.
        let partial = "Hello".asSlice().loadUint(41);
    }
}
