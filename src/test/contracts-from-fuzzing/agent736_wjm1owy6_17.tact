struct ChainThree {
    s: Second;
}

struct Second {
    f: First;
    x: Int;
}

struct First {
    y: Bool;
}

contract TestContract {
    chain: ChainThree = ChainThree{s: Second{f: First{y:true}, x:42}};

    init() {
        self.chain = ChainThree{s: Second{f: First{y:true}, x:42}};
    }

    receive() {
        dump(self.chain.s.f.y);
    }
}