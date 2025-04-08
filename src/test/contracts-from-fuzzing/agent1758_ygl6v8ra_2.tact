struct Nested {
    x: Int;
    y: Int;
}

contract NestedStructs {
    point: Nested;
    
    init() {
        self.point = Nested {
            x: 10,
            y: 20,
        };
    }
}