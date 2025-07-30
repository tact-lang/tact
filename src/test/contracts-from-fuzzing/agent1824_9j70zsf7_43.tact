// Optional struct containing remaining suffix also optional
struct LeafRem {
    tail: Slice as remaining;
}

struct MaybeLeaf {
    leaf: LeafRem?;
}

contract OptRemSuffix {
    data: MaybeLeaf;

    init() {
        self.data = MaybeLeaf{ leaf: null };
    }
}
