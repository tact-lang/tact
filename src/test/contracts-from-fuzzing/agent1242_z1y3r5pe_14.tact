struct Inner {
    b: Bool;
}

contract Test {
    foo: Int;
    bar: Inner;
    baz: String;

    init() {
        self.foo = 1;
        self.bar = Inner{ b: false };
        self.baz = "hello";
    }
}
