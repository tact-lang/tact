contract TestMulDiv {
    receive() {
        // Test binary multiplication, division, and modulo expressions
        let a: Int = 3 * 4;       // expected 12
        let b: Int = 20 / 4;      // expected 5
        let c: Int = 10 % 3;      // expected 1
    }
}
