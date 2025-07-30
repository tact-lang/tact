struct DeeplyOptional {
    nested: Int?;
    nestedStruct: StructNested?;
}

struct StructNested {
    value: Bool;
}

contract OptNestedTest {
    f: DeeplyOptional;
    init() {
        self.f = DeeplyOptional{
            nested: null,
            nestedStruct: null
        };
    }
}
