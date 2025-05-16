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
    x: Int;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        x: 5
                    }
                }
            }
        };
    }
}
