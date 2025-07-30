struct Leaf {
    x: Int;
}

struct Mid {
    l: Leaf;
}

struct TopMost {
    m: Mid;
}

contract MultiStructChain {
    chain: TopMost = TopMost{m: Mid{l: Leaf{x:0}}};

    init() {
        self.chain = TopMost{m: Mid{l: Leaf{x:10}}};
    }
}
