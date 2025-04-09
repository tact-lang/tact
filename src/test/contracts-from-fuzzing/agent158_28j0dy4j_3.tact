struct Coordinates {
    x: Int?;
    y: Int?;
}

contract OptNested {
    point: Coordinates;

    init() {
        self.point = Coordinates{
            x: null,
            y: 42
        };
    }
}