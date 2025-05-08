struct DeeplyNested {
    nested: Inner;
}

struct Inner {
    flag: Bool;
    coord: Coord;
}

struct Coord {
    x: Int;
    y: Int;
}

contract TestNested {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            nested: Inner{
                flag: true,
                coord: Coord{ x: 1, y: 2 }
            }
        };
    }
}