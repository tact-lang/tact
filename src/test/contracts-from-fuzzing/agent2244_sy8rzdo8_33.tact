contract NestedOptSer {
    foo: Int? as uint8;
    bar: Int? as uint32;
    baz: Int? as int64;
    bo: Bool?;
    st: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.bo = null;
        self.st = null;
    }
}