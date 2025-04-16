struct Coordinates {
    x: Int = 123;
    y: Int = 456;
}

contract DefaultLargeStruct {
    coord: Coordinates;
    init() {
        self.coord = Coordinates{};
    }
}