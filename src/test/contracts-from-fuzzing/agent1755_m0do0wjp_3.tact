struct InnerNested {
    intField: Int;
}

struct OuterNested {
    nested: InnerNested;
}

contract TestContract {
    nestedField: OuterNested;

    init() {
        self.nestedField = OuterNested{ nested: InnerNested{ intField: 0 } };
    }
}
