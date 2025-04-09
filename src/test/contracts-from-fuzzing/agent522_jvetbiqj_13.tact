struct NestedOptional {
    val: Int?;
}

struct Top {
    nested: NestedOptional?;
}

contract OptionalInOptional {
    value: Top;

    init() {
        self.value = Top{
            nested: null,
        };
    }
}