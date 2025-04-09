struct Nested { x: Int; y: Int; }

contract TestStorage {
    point: Nested;
    
    init() {
        self.point = Nested { x: 1, y: 2 };
    }
}