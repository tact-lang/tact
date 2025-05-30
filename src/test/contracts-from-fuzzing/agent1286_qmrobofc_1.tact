struct Nested {
    x: Int;
    y: Int;
}

contract TestContract {
    p: Nested;
    
    init() {
        self.p = Nested{ x: 1, y: 2 };
    }
}