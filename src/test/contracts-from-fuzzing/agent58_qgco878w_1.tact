struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestDeepNest {
    nested: Inner;

    init() {
        self.nested = Inner{
            foo: 123,
            bar: true,
        };
    }
}