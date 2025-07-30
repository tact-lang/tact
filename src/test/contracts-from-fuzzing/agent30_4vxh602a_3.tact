struct Nested {
    level2: Int;
}

struct Container {
    nested: Nested;
}

struct Wrapper {
    container: Container;
}

contract DeepNestedStructs {
    data: Wrapper;
    
    init() {
        self.data = Wrapper{ container: Container{ nested: Nested{ level2: 123 } } };
    }
}