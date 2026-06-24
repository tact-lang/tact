contract TestBitwiseOr {
    receive() {
        let a: Int = 2 | 1; // binary bitwise OR
        dump(a);
    }
}
