struct DeepNested {
    inner: Nested;
}

struct Nested {
    num: Int;
}

contract Test {
    field: DeepNested;
    
    init() {
        self.field = DeepNested{
            inner: Nested{ num: 42 }
        };
    }
}