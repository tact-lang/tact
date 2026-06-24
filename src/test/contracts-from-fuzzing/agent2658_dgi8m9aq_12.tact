struct InnerNested {
    z: Int?;
}

struct NestedMixed {
    x: Int;
    y: String?;
    nested: InnerNested;
}

contract NestedMixedTypes {
    data: NestedMixed = NestedMixed{
        x: 7,
        y: null,
        nested: InnerNested{ z: null }
    };
}