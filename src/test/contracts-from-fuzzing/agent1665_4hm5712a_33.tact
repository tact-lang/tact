// Mixed serializations of ints
contract Test33 {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;

    init() {
        self.a = 12;
        self.b = -123;
        self.c = 456789;
    }
}