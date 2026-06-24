struct DeepNested {
    field1: Int;
    field2: InnerLevel1;
}

struct InnerLevel1 {
    innerField1: Int;
    innerField2: InnerLevel2;
}

struct InnerLevel2 {
    deepestField: Int;
    optionalDeep: Int?;
}

contract TestContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            field1: 1,
            field2: InnerLevel1{
                innerField1: 2,
                innerField2: InnerLevel2{
                    deepestField: 3,
                    optionalDeep: null
                }
            }
        };
    }
}
