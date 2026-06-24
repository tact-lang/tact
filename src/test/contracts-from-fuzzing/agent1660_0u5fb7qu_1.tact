struct Coordinates {
    x: Int;
    y: Int;
}

contract TestContract {
    position: Coordinates;
    
    init() {
        self.position = Coordinates{ x: 1, y: 2 };
    }
}