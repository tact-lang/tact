struct Coord {
    x: Int as uint32;
    y: Int as int64;
}

struct Wrap {
    c: Coord;
    identifier: String;
}

contract SerializeNested {
    val: Wrap;

    init() {
        self.val = Wrap{
            c: Coord{ x: 5, y: -5 },
            identifier: "ID"
        };
    }
}