struct LeafOpt {
    val: Int = 5;
}

struct RootOpt {
    optLeaf: LeafOpt?;
}

contract NestedOptionalStructField {
    data: RootOpt = RootOpt{ optLeaf: null };
}