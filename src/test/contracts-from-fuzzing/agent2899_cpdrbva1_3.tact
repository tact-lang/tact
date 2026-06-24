struct NestedOptional {
    inner: Int?;
}

struct OuterOptional {
    nested: NestedOptional?;
}

contract OptionalStructs {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{ nested: null };
    }
}
