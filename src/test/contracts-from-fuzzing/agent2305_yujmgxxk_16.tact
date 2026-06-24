struct StructWithOptionalStruct {
    nested: Nested?;
}

struct Nested {
    x: Int;
}

contract TestOptStructNested {
    s: StructWithOptionalStruct;

    init() {
        self.s = StructWithOptionalStruct{
            nested: null
        };
    }
}
