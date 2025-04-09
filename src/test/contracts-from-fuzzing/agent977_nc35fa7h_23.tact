// contract fields with complex serialization
contract Serialize {
    foo: Int as uint8;
    bar: Int as int32;
    baz: Int as uint64;
    qux: Int;
    init() {
        self.foo = 12;
        self.bar = -123456;
        self.baz = 12345678910;
        self.qux = 98765432100;
    }
}