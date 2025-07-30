struct NestedOptionalStruct {
    number: Int?;
    text: String?;
    flag: Bool?;
}

struct OuterContainer {
    nested: NestedOptionalStruct;
    value: Int;
}

contract TestContract {
    field: OuterContainer;
    init() {
        self.field = OuterContainer{
            nested: NestedOptionalStruct{number: null, text: null, flag: null},
            value: 100
        };
    }
}