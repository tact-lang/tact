struct InnerStruct {
    value: Int;
    text: String;
}

struct OuterStruct {
    field1: Int;
    nested: InnerStruct?;
    flag: Bool?;
    comment: String;
}

contract NullableNested {
    outer: OuterStruct;

    init() {
        self.outer = OuterStruct{
            field1: 5,
            nested: null,
            flag: true,
            comment: "test"
        };
    }
}
