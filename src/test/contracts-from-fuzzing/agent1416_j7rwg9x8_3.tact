struct DeepNested {
    field1: Int;
    nested1: NestedOne;
}

struct NestedOne {
    nested2: NestedTwo;
}

struct NestedTwo {
    nested3: NestedThree;
}

struct NestedThree {
    value: Int;
}

contract DeepNestedStorage {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            field1: 5,
            nested1: NestedOne{
                nested2: NestedTwo{
                    nested3: NestedThree{
                        value: 99
                    }
                }
            }
        };
    }
}