struct NestedOptionalStruct {
    field1: Int?;
    nestedStruct: NestedInnerStruct?;
}

struct NestedInnerStruct {
    innerField: Int?;
    anotherField: Bool?;
}

contract OptionalNestedTest {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            field1: null,
            nestedStruct: null,
        };
    }
}