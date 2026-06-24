struct OptionalNested {
    nested: Nested?;
}

struct Nested {
    value: Int;
}

contract OptionalInside {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ nested: null };
    }
}