struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract Test {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = Inner{
            foo: 1,
            bar: false,
            baz: "abc",
        };
    }
}