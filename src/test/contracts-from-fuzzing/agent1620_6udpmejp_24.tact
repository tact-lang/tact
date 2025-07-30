struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedMultiType {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 5,
            b: false,
            c: "abc",
        };
    }
}