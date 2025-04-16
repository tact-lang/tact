struct DeeplyNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    value: Int?;
    flag: Bool;
}

contract TestDeep {
    deepValue: DeeplyNested;

    init() {
        self.deepValue = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        value: 42,
                        flag: true
                    }
                }
            }
        };
    }
}