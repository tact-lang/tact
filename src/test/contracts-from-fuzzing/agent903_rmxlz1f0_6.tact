struct InnerOptional {
    value: Int?;
}

struct OuterOptional {
    nested: InnerOptional?;
}

contract OptionalNesting {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{ nested: null };
    }
}