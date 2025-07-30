struct Leaf {
    val: Int;
}

struct MiddleOpt {
    leaf: Leaf?;
}

struct RootOpt {
    mid: MiddleOpt?;
}

contract StructCascadeOpt {
    root: RootOpt;

    init() {
        self.root = RootOpt{ mid: null };
    }
}