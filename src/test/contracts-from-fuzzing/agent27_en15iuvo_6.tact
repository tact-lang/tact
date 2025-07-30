struct OptionalNested {
    v: Int?;
}

struct OuterOptional {
    nested: OptionalNested?;
}

contract NestedNull {
    store: OuterOptional;

    init() {
        self.store = OuterOptional{ nested: null };
    }
}