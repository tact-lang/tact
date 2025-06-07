contract FieldReorderTest {
    a: Int as uint32;
    b: Bool;
    c: Int as int16;

    init() {
        self.a = 42;
        self.b = true;
        self.c = -12345;
    }
}