contract ReorderedSerialization {
    a: Int as uint8;
    b: Bool;
    c: Int as uint4;
    d: Bool;

    init() {
        self.a = 12;
        self.b = false;
        self.c = 10;
        self.d = true;
    }
}