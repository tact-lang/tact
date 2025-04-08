struct DeeplyNested {
    nested1: NestedLevel1;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
}

struct NestedLevel3 {
    flag: Bool?;
    value: Int;
}

contract TestDeepNesting {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            nested1: NestedLevel1{
                nested2: NestedLevel2{
                    nested3: NestedLevel3{ flag: null, value: 42 }
                }
            }
        };
    }
}
