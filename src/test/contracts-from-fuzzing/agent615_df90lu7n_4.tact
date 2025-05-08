struct Leaf {
    z: Int?;
}

struct Mid {
    l: Leaf?;
}

struct Root {
    m: Mid;
}

contract NestedOpt {
    val: Root = Root{
        m: Mid{ l: null }
    };

    init() {
        self.val = self.val;
    }

    receive() {
        self.val = self.val;
    }
}