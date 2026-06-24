struct LeafLeaf {
    score: Int?;
}

struct Leaf {
    name: String;
    deep: LeafLeaf?;
}

struct RootRoot {
    val: Leaf?;
}

contract OptChain {
    r: RootRoot;

    init() {
        self.r = RootRoot{ val: null };
    }
}
