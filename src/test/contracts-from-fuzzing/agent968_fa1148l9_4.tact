struct NestedOptional {
    inner: Int?;
}

contract OptionalField {
    field: NestedOptional;
    init() {
        self.field = NestedOptional{
            inner: null
        };
    }
}
