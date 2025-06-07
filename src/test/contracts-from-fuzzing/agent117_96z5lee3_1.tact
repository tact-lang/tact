struct Inner {
    foo: Int;
    bar: Bool;
}

contract Test1 {
    nested: Inner;

    init() {
        self.nested = Inner{foo: 1, bar: true};
    }
}