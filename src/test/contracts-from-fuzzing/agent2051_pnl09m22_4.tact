struct DeepNested {
    lvl1: NestedCoord;
}

struct NestedCoord {
    lvl2: Coord;
}

struct Coord {
    x: Int;
    y: Int;
}

contract DeepNestedFields {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{ lvl1: NestedCoord{ lvl2: Coord{ x: 7, y: 11 } } };
    }
}