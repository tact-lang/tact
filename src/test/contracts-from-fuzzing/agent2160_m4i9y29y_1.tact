struct NestedStruct {
    innerField1: Int;
    innerField2: String;
}

contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            innerField1: 5,
            innerField2: "hello"
        };
    }
}