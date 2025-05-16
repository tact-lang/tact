struct DeepNested {
    innermost: InnerStruct;
}

struct InnerStruct {
    number: Int;
    flag: Bool;
}

contract TestContract {
    nestedField: DeepNested;

    init() {
        self.nestedField = DeepNested{
            innermost: InnerStruct{
                number: 42,
                flag: false
            }
        };
    }
}