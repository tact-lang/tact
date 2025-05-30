struct Leaf {
    q: Int;
}

struct Mid {
    leafOpt: Leaf?;
}

struct Root {
    mid: Mid;
}

contract OptStructTree {
    val: Root = Root{
        mid: Mid{ leafOpt: null }
    };

    init() {
        self.val = Root{
            mid: Mid{ leafOpt: Leaf{ q: 321 } }
        };
    }
}