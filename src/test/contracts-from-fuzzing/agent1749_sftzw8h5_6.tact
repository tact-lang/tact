struct NestedOptionals {
    one: Int?;
    two: Bool?;
}

struct ParentOptStruct {
    nested: NestedOptionals?;
    value: Int;
}

contract OptStructField {
    field: ParentOptStruct;

    init() {
        self.field = ParentOptStruct{
            nested: null,
            value: 77,
        };
    }
}