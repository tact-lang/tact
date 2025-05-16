// Testing Int serialization edge bits plus optionals
contract TestContract {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint128;
    d: Int as int257;
    e: Int?;
    f: Int?;

    init() {
        self.a = 100;
        self.b = -100;
        self.c = 123456789012345;
        self.d = -9876543210987654321;
        self.e = null;
        self.f = 0;
    }
}