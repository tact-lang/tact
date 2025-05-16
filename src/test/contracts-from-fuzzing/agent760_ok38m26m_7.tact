contract OrderTest {
    a: Int as uint8;
    b: Int as uint256;
    c: Bool;
    d: String;
    init() {
        self.a = 255;
        self.b = 1 << 255;
        self.c = true;
        self.d = "order";
    }
}
