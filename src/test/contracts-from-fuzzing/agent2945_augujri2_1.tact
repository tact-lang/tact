struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    testField: Nested;
    
    init() {
        self.testField = Nested{a: 42, b: true};
    }
}