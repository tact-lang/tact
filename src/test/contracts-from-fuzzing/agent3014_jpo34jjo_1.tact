struct Nested {
    x: Int;
    y: Int;
}

struct Container {
    fieldA: Int;
    nested: Nested;
    optNested: Nested?;
}

contract TestContract {
    data: Container;
    
    init() {
        self.data = Container{
            fieldA: 1,
            nested: Nested{ x: 2, y: 3 },
            optNested: null,
        };
    }
}