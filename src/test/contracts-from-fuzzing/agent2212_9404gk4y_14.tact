struct Nested {
    foo: Int;
}

contract Test {
    optNested: Nested?;

    init() {
        self.optNested = null;
    }
}
