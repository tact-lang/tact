struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct StructWithNested {
    nested: NestedOptionals?;
    num: Int;
    flag: Bool;
}

contract NestedOptionalFields {
    field: StructWithNested;

    init() {
        self.field = StructWithNested{
            nested: null,
            num: 123,
            flag: false
        };
    }
}