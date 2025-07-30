// Multiple 'remaining' suffixes deeply nested on different paths
struct Leaf1 {
    x: Int;
    sfx: Slice as remaining;
}

struct Leaf2 {
    y: Int;
    sfx2: Slice as remaining;
}

struct Branches {
    l1: Leaf1;
    l2: Leaf2;
}

contract MultiSuffixes {
    data: Branches;

    init() {
        self.data = Branches{
            l1: Leaf1{ x:1, sfx: emptyCell().asSlice() },
            l2: Leaf2{ y:2, sfx2: emptyCell().asSlice() },
        };
    }
}
