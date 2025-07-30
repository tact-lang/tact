struct Leaf {
    a: Int;
}

struct Mid {
    l: Leaf?;
}

contract OptionalLeafMid {
    m: Mid?;

    init() {
        self.m = Mid{
            l: Leaf{a:42}
        };
    }
}