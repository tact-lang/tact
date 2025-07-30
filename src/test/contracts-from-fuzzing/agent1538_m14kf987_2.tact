struct Nested {
    a: Int;
}

struct Outer {
    nestedField: Nested;
    b: Int;
}

contract TestContract {
    complexField: Outer;
    
    init() {
        self.complexField = Outer{
            nestedField: Nested{ a: 1 },
            b: 2
        };
    }
}