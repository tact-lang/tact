struct Leaf {
    num: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct RootOpt {
    mid: Mid?;
}

contract DeepNestedOptionals {
    root: RootOpt?;

    init() {
        self.root = null;
    }
}