contract TestBitwiseNot {
    receive() {
        // Bitwise NOT: expected to invert each bit of 42, yielding -43
        let a: Int = ~42;
        dump(a);
    }
}
