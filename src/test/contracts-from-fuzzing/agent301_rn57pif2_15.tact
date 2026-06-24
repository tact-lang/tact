contract TestContract {
    a: Int as uint8 = 1;
    b: Int as int4 = -3;
    c: Int as uint1 = 1;
    d: Int as int1 = -1;

    receive() {
        let _ = self.a + self.b;
    }
}