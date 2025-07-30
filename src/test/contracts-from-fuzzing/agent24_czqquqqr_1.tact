struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Nested;
    
    init() {
        self.field1 = Nested{a: 5, b: true};
    }

    receive() {
        // trigger
        self.field1 = Nested{a: 10, b: false};
    }
}
