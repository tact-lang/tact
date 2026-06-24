struct MidNested {
    c: Int;
}

struct Higher {
    nested: MidNested?;
}

contract NullableNestedStruct {
    higher: Higher;

    init() {
        self.higher = Higher{
            nested: null
        };
    }
}
