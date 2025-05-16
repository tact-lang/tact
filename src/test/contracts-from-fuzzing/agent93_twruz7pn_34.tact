struct LeafDeep {
    goal: String?;
    hits: Int? = 5;
}

struct NodeDeep {
    leaf: LeafDeep?;
    done: Bool? = false;
}

contract OuterNullOptChain {
    nd: NodeDeep?;

    init() {
        self.nd = null;
    }
}