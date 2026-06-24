struct NestedOptional {
    inner: Int?;
}

contract OptionalInOptional {
    field: NestedOptional?;
    init() {
        self.field = NestedOptional{ inner: 10 };
    }
}