struct Coordinates {
    x: Int as int64;
    y: Int as int64;
}

contract TestNestedOptional {
    position: Coordinates?;

    init() {
        self.position = null;
    }
}