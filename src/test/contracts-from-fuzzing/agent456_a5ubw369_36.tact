struct NestedOptional {
    inner: Int?;
}

contract OptionalStructOptionalField {
    opt: NestedOptional?;

    init() {
        self.opt = null;
    }
}