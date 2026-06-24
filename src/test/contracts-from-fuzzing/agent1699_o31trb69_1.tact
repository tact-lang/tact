struct DeepNested {
    nested1: Nested1;
}

struct Nested1 {
    nested2: Nested2;
}

struct Nested2 {
    nested3: Nested3;
}

struct Nested3 {
    x: Int;
}

contract Test {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            nested1: Nested1{
                nested2: Nested2{
                    nested3: Nested3{
                        x: 1
                    }
                }
            }
        };
    }
}