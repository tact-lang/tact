struct Leaf {
    v: Int;
}

struct Mid {
    leaf: Leaf?;
}

contract NestedNullAssign {
    mid: Mid;

    init() {
        self.mid = Mid{
            leaf: null
        };
    }
}