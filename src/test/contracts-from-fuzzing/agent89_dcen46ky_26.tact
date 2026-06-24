contract Fuzz26 {
    foo: Int as int1 = 0;
    bar: Int as uint1 = 1;
    baz: Int as int257 = -1;
    qux: Int as uint256 = 2;

    init() {
        self.foo = -1;
        self.bar = 1;
        self.baz = -10;
        self.qux = 100;
    }
}