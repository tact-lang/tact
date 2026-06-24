contract LargeSerialization {
    a: Int as uint256;
    b: Int as int257;
    c: Int;

    init() {
        self.a = 123456789;
        self.b = -987654321;
        self.c = 42;
    }
}