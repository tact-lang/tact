struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract NestedStructField {
    s: Inner;

    init() {
        self.s = Inner{
            foo: 42,
            bar: true,
            baz: "hello"
        };
    }

    receive() {
        self.s = Inner{
            foo: self.s.foo + 1,
            bar: !self.s.bar,
            baz: "world"
        };
    }
}