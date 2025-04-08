struct DeepNestedOptional {
    inner: Int?;
}

contract OptionalNestedField {
    s: DeepNestedOptional?;

    init() {
        self.s = DeepNestedOptional{
            inner: null
        };
    }
}