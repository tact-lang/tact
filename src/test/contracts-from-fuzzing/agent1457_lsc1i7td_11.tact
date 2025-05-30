// testing storage Int serialization annotations
contract AnnotatedInts {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as coins;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 42;
        self.d = ton("1");
    }
}
