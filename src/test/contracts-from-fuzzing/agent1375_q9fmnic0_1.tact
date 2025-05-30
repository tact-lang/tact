struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract TestContract {
    position: Coordinates;

    init() {
        self.position = Coordinates{ x: 10, y: 20 };
    }
}