contract FieldOrderTest {
    a: Int as uint8;
    b: Bool;
    c: Int;
    d: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 1234;
        self.d = myAddress();
    }
}