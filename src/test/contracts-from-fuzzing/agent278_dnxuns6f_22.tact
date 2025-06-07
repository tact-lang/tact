struct Top {
    child: Middle;
    opt: Bool?;
}

struct Middle {
    grandchild: Leaf;
}

struct Leaf {
    val: Int;
}

contract MixOptNested {
    root: Top;
    init() {
        self.root = Top{
            child: Middle{ grandchild: Leaf{ val: 7 } },
            opt: null
        };
    }
}