struct ComplexNested {
    field1: Int;
    opt1: Bool?;
    nested: NestedStruct;
}

struct NestedStruct {
    inner1: String;
    innerOpt: Address?;
}

contract ComplexNestedContract {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            field1: 7,
            opt1: null,
            nested: NestedStruct{
                inner1: "abc",
                innerOpt: null
            }
        };
    }
}
