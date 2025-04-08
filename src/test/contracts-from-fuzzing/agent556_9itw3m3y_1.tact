struct Nested1 {
    value1: Int;
    optValue1: Int?;
}

struct Nested2 {
    nested1: Nested1;
    optNested1: Nested1?;
}

contract DeepNestedTest {
    data: Nested2;
    
    init() {
        self.data = Nested2{
            nested1: Nested1{ value1: 1, optValue1: null },
            optNested1: null
        };
    }
}
