struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptNested {
    nested: NestedOpt?;

    init() {
        self.nested = null;
    }
}