struct DeepNested {
    field1: Int;
    nested1: NestedLevel1;
}

struct NestedLevel1 {
    field2: Int;
    nested2: NestedLevel2;
}

struct NestedLevel2 {
    field3: Int;
    nested3: NestedLevel3;
}

struct NestedLevel3 {
    field4: Int;
    nested4: NestedLevel4;
}

struct NestedLevel4 {
    field5: Int;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            field1: 1,
            nested1: NestedLevel1{
                field2: 2,
                nested2: NestedLevel2{
                    field3: 3,
                    nested3: NestedLevel3{
                        field4: 4,
                        nested4: NestedLevel4{
                            field5: 5
                        }
                    }
                }
            }
        };
    }
}
