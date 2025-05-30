struct Coordinates {
    a: Int = 7;
    b: Int?;
    c: String = "default";
}

contract TestContract {
    coords: Coordinates;

    init() {
        self.coords = Coordinates{};
    }
}