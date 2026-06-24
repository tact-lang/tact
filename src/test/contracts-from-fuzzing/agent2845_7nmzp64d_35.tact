struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptStructField {
    nested: NestedOpt?;

    init() {
        self.nested = null;
    }
}