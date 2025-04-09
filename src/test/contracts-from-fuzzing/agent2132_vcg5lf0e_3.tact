struct Inner {
    x: Int;
}

contract OptionalsTest {
    foo: Inner?;
    bar: Int?;
    baz: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}