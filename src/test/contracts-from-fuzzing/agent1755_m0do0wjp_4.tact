struct InnerNested {
    intField: Int;
    optInt: Int?;
}

struct OuterNested {
    nested: InnerNested?;
}

contract TestContract {
    nestedField: OuterNested;

    init() {
        self.nestedField = OuterNested{ nested: null };
    }
}
