struct Nested {
    foo: Int;
    bar: Bool?;
}

contract Test {
    optNested: Nested?;

    init() {
        self.optNested = null;
    }
}
