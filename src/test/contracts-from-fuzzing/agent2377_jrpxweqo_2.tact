struct NestedOptionals {
    field1: Int?;
    field2: Bool?;
    field3: Address?;
}

struct OuterStruct {
    nested: NestedOptionals;
    anotherField: Int;
}

contract OptStructFields {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: NestedOptionals{
                field1: null,
                field2: null,
                field3: null,
            },
            anotherField: 123,
        };
    }
}