struct Coordinates {
    latitude: Int;
    longitude: Int;
    altitude: Int?;
    name: String?;
}

contract Fuzz11 {
    point: Coordinates?;

    init() {
        self.point = null;
    }
}