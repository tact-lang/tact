struct Nested {
    a: Int;
    b: Int?;
}

contract Test {
    pair: Nested;
    
    init() {
        self.pair = Nested{ a: 7, b: 8 };
    }
}