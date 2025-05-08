struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptStructDefault {
    nested: NestedOpt? = null;

    init() {
        self.nested = null;
    }
}