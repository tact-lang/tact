struct NestedOptional {
    innerOpt: Int?;
}

contract OptionalNestedField {
    nestedOpt: NestedOptional?;

    init() {
        self.nestedOpt = null;
    }
}