struct Leaf {
    foo: Int;
    trail: Slice as remaining;
}

struct WithLeaf {
    leaf: Leaf;
    txt: String;
}

contract HasRemainingInside {
    data: WithLeaf;

    init() {
        self.data = WithLeaf{
            leaf: Leaf{ foo: 5, trail: emptyCell().asSlice() },
            txt: "data",
        };
    }
}
