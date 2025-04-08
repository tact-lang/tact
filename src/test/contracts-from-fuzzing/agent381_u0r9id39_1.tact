struct Nested {
    x: Int;
    y: Int;
}

contract Test {
    data: Nested;
    
    init() {
        self.data = Nested{x: 1, y: 2};
    }
}