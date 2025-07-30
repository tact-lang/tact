contract TestBitwiseOr {
    receive() {
        // Testing bitwise OR operator
        let a: Int = 0b1010 | 0b0101; // expected 0b1111 = 15
        dump(a);

        let b: Int = 255 | 0b00001111; // expected 255
        dump(b);
    }
}
