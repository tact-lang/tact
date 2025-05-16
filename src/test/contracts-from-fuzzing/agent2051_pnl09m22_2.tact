struct NestedCoord {
    p: Coord;
}

struct Coord {
    x: Int;
    y: Int;
}

contract NestedStructField {
    nested: NestedCoord;

    init() {
        self.nested = NestedCoord{ p: Coord{ x: 1, y: 2 } };
    }
}