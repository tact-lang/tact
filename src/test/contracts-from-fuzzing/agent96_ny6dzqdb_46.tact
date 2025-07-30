contract Test {
    a: Int = 5;
    b: Int as uint8 = 255;
    c: Int as int8 = -128;
    d: String = "test";
    e: Bool = true;
    f: Address;

    init() {
        self.f = myAddress();
    }
}