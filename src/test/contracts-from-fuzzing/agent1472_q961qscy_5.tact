struct NestedOpt {
    innerOpt: Int?;
    flag: Bool;
}

contract OptionalWithNestedOpt {
    nested: NestedOpt?;

    init() {
        self.nested = null;
    }
}
