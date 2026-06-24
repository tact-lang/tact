struct NestedOptionals {
    inner: Int?;
}

struct Top {
    nested: NestedOptionals?;
}

contract OptionalNesting {
    value: Top;

    init() {
        self.value = Top{nested: null};
    }
}