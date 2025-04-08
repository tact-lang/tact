contract FieldOrderingTest {
    a: Int as uint8;
    b: Int;
    c: Bool;
    d: Int as coins;

    init() {
        self.a = 250;
        self.b = 1000;
        self.c = true;
        self.d = ton("1");
    }
}
