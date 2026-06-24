struct Nested {
    x: Int;
    y: Int?;
}

contract Test {
    point: Nested;
    
    init() {
        self.point = Nested{x: 5, y: null};
    }
}