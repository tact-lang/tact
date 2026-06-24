struct DepthTest {
    nested1: Nested1;
}

struct Nested1 {
    nested2: Nested2;
}

struct Nested2 {
    nested3: Nested3;
}

struct Nested3 {
    value: Int;
}

contract DeepNestedTest {
    data: DepthTest;
    
    init() {
        self.data = DepthTest{
            nested1: Nested1{
                nested2: Nested2{
                    nested3: Nested3{
                        value: 42
                    }
                }
            }
        };
    }
}
