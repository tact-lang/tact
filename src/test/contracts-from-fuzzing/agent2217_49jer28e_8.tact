struct P {
    u: Int;
    v: Bool;
}

contract OptsTest {
    foo: Int?;
    bar: Bool?;
    baz: P?;

    init() {
        self.foo = null;
        self.bar = true;
        self.baz = null;
    }
}
