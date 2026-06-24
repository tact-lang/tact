struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{ a: 10, b: true };
    }
}