struct DeepNested {
    leaf: Int;
}

struct NestedTwo {
    optNested: DeepNested?;
}

struct NestedOne {
    nestedTwo: NestedTwo;
}

contract TestContract {
    deepField: NestedOne;
    
    init() {
        self.deepField = NestedOne{
            nestedTwo: NestedTwo{
                optNested: DeepNested{
                    leaf: 1
                }
            }
        };
    }
}