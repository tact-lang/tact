struct Nested {
    a: Int;
    b: Bool?;
}

contract TestContract {
    foo: Nested;
    
    init() {
        self.foo = Nested{a: 1, b: true};
    }
}