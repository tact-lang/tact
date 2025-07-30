struct Nested {
    value: Int;
}

struct Container {
    nestedField: Nested;
}

contract Test {
    container: Container;
    
    init() {
        self.container = Container{ nestedField: Nested{ value: 42 } };
    }
}