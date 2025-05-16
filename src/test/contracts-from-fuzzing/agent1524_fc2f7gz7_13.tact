// test serialization format annotations
contract SerFormats {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Int as uint256;

    init() {
        self.a = 100;
        self.b = -1000000;
        self.c = ton("1");
        self.d = 123456789;
    }
}