struct InnerNested {
    intField: Int;
}

struct OuterNested {
    nested: InnerNested;
}

contract TestContract {
    nestedField: OuterNested = OuterNested{ nested: InnerNested{ intField: 0 } };
}
