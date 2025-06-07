contract FieldOrderTest {
    a: Int as uint8 = 1;
    b: Int = 2;
    c: Int as uint16 = 3;
    d: Int as int64 = 4;
    e: Int as int257 = 5;
    f: Bool = true;

    init() {
        self.b = 22;
        self.e = 55;
    }
}