struct OuterStruct {
    innerOne: Int;
    innerTwo: NestedStruct;
}

struct NestedStruct {
    nestedVal: Int;
    another: Int;
}

contract ReorderedNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            innerOne: 50,
            innerTwo: NestedStruct{
                nestedVal: 60,
                another: 70
            }
        };
    }
}