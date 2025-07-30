struct Nested {
    x: Int;
    y: Int?;
}

contract TestContract {
    coord: Nested;
    
    init() {
        self.coord = Nested { x: 5, y: null };
    }
}
