contract SerializeAllPrimitives {
    a: Int as int32;
    b: Int as uint16;
    c: Bool;
    d: Address;

    init() {
        self.a = 1234;
        self.b = 65535;
        self.c = true;
        self.d = myAddress();
    }
}