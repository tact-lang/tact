struct NestedOptional {
    inner: Int?;
}

contract OptionalField {
    f: NestedOptional?;

    init() {
        self.f = null;
    }
}