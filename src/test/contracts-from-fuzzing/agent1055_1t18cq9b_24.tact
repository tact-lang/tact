struct Leaf {
    x: Int as uint8;
    y: Bool?;
    z: String;
}

struct Mid {
    flag: Bool;
    leaf: Leaf;
    score: Int as int16;
}

struct Root {
    id: Int as uint32;
    midNode: Mid?;
    note: String?;
}

contract ComplexMix {
    data: Root;

    init() {
        self.data = Root{
            id: 1234,
            midNode: null,
            note: null,
        };
    }
}