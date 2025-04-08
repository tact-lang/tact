struct DeepNest {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    value: Int;
}

contract TestContract {
    nest: DeepNest;

    init() {
        self.nest = DeepNest{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        value: 123
                    }
                }
            }
        };
    }
}
