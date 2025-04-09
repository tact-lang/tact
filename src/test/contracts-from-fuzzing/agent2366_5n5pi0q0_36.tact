struct Outermost {
    mid: Middle?;
}

struct Middle {
    leaf: Leaf?;
}

struct Leaf {
    a: Int;
}

contract MultiOpt {
    root: Outermost?;

    init() {
        self.root = null;
    }
}