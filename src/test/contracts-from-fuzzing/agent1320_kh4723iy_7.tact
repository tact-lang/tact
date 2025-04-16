struct Coord {
    lat: Int = 9;
    lon: Int = 11;
}

struct Location {
    name: String = "Mars";
    coord: Coord;
}

contract DeepNested {
    loc: Location = Location{ coord: Coord{} };
}