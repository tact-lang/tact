struct Leaf {
    z: Bool;
}

struct Mid {
    y: Int?;
    leaf: Leaf;
}

contract DeepNested {
    f: Mid;

    init() {
        self.f = Mid{
            y: null,
            leaf: Leaf{ z: false },
        };
    }
}