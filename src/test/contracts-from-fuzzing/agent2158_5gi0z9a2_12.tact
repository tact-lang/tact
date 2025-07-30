contract SerializeAnnotations {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Bool;

    init() {
        self.a = 1;
        self.b = -42;
        self.c = 123456789;
        self.d = true;
    }
}