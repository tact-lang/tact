// A contract with some fields having explicit serialization types
contract Serialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as coins;
    d: Bool;
    e: Address;
    init() {
        self.a = 123;
        self.b = -12345;
        self.c = 1000000;
        self.d = true;
        self.e = myAddress();
    }
}