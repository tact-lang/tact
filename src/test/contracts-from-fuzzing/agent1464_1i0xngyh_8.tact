struct Leaf {
    leafVal: Int;
}

struct Mid {
    mVal: Int;
    l: Leaf;
    optLeaf: Leaf?;
}

struct Root {
    topVal: Int;
    m: Mid;
    mOpt: Mid?;
}

contract TreeContract {
    root: Root;

    init() {
        self.root = Root{
            topVal: 1,
            m: Mid{
                mVal: 2,
                l: Leaf{ leafVal: 3 },
                optLeaf: null
            },
            mOpt: null
        };
    }
}
