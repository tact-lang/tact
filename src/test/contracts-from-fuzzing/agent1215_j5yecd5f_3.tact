struct Leaf { val: Int; }

struct Middle {
    leaf1: Leaf;
    optLeaf1: Leaf?;
    leaf2: Leaf;
    optLeaf2: Leaf?;
}

struct Top {
    mid1: Middle;
    optMid1: Middle?;
    mid2: Middle;
    optMid2: Middle?;
}

contract MultiNested(
    param: Top,
    optParam: Top?,
) {}