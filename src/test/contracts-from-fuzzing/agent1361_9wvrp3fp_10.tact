struct Coord {
    x: Int;
    y: Int;
}

struct Mixed {
    p: Coord;
    label: String?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{p: Coord{x: 10, y: 20}, label: null};
    }
}