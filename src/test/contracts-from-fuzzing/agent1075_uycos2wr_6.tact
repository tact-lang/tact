struct NestedOptional {
    field1: Int?;
    field2: String?;
}

struct OuterStruct {
    nested: NestedOptional;
    num: Int;
}

contract OptionalInNestedStruct {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{ nested: NestedOptional{field1: null, field2: null}, num: 42 };
    }
}