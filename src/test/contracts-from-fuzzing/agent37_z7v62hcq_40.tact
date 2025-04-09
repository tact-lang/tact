contract Test {
    a: Int as int4;
    b: Int as uint8;
    init() {
        self.a = 123;     // exceeds int4 max (7)
        self.b = 300;     // exceeds uint8 max (255)
    }
}