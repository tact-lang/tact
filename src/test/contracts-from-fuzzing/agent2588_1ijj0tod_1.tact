struct DeepNested {
    level1: Nested1;
}

struct Nested1 {
    level2: Nested2;
}

struct Nested2 {
    level3: Nested3;
}

struct Nested3 {
    val: Int;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            level1: Nested1{
                level2: Nested2{
                    level3: Nested3{
                        val: 42
                    }
                }
            }
        };
    }
}