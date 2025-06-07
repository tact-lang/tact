// Mix of nested, optionals, and default values all combined together
struct Leaf {
    x: Int?;
    y: Bool = true;
}

struct Mid {
    leaf: Leaf?;
    z: String;
}

contract UltimateTest {
    mid: Mid;

    init() {
        self.mid = Mid{
            leaf: null,
            z: "Z"
        };
    }
}