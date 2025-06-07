struct Coord {
    x: Int;
    y: Int;
}

struct NamedPoint {
    name: String;
    pos: Coord;
}

contract Test {
    label: String;
    origin: Coord;
    target: NamedPoint;
    enable: Bool;

    init() {
        self.label = "unit";
        self.origin = Coord{ x: 0, y: 0 };
        self.target = NamedPoint{ name: "dest", pos: Coord{ x: 1, y: 1 } };
        self.enable = true;
    }
}