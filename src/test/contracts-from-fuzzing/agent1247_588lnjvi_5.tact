struct NestedOptional {
    inner: Int?;
}

struct Outer {
    nested: NestedOptional?;
}

contract OptionalInOptional {
    field: Outer;

    init() {
        self.field = Outer {
            nested: null
        };
    }
}