struct OptDeepNested {
    lvl1: NestedCoord?;
}

struct NestedCoord {
    lvl2: Coord?;
}

struct Coord {
    x: Int?;
    y: Int?;
}

contract OptionalDeepNestedFields {
    deepOpt: OptDeepNested;

    init() {
        self.deepOpt = OptDeepNested{
            lvl1: NestedCoord{
                lvl2: Coord{ x: null, y: null }
            }
        };
    }
}