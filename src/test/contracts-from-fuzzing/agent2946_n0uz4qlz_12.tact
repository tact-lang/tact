struct OptionalNested {
    inner: InnerOption?;
}

struct InnerOption {
    val: Int;
}

contract NullableNestedField {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ inner: null };
    }
}