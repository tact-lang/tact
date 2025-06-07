struct NestedOptionals {
    inner1: Int?;
    inner2: Bool?;
}

struct OuterWithOptionalNested {
    nested: NestedOptionals?;
    other: Int;
}

contract StructWithOptionalStruct {
    field: OuterWithOptionalNested;
    init() {
        self.field = OuterWithOptionalNested{
            nested: null,
            other: 9
        };
    }
}