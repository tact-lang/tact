struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    optNested: NestedOpt?;

    init() {
        self.optNested = null;
    }

    receive() {}
}