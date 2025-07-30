struct Nested {
    inner_x: Int;
    inner_y: Int;
}

contract TestContract {
    point: Nested;
    
    init() {
        self.point = Nested{inner_x: 1, inner_y: 2};
    }
}