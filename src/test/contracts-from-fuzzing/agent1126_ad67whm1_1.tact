struct Nested1 {
    value: Int;
}

struct Nested2 {
    inner: Nested1;
}

contract DeepNestedTest {
    data: Nested2;
    
    init() {
        self.data = Nested2{ inner: Nested1{ value: 42 } };
    }
}