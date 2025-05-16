struct Coordinates {
    x: Int;
    y: Int;
}

contract OptionalNested {
    position: Coordinates?;

    init() {
        self.position = Coordinates{
            x: 10,
            y: 20,
        };
    }

    receive() {}
}