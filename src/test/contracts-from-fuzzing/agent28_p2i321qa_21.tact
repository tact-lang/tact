contract TestBitwiseShifts {
    receive() {
        let a: Int = 1 << 3;  // left shift: expected 8
        let b: Int = 8 >> 3;  // right shift: expected 1
        dump(a);
        dump(b);
    }
}
