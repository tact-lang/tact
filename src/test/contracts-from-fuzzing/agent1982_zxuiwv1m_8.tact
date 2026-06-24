struct HasOptionalNested {
    nestedOpt: Nested?;
}

struct Nested {
    x: Int;
    y: Int;
}

contract OptNestedDefault {
    store: HasOptionalNested;

    init() {
        self.store = HasOptionalNested { nestedOpt: null };
    }
}