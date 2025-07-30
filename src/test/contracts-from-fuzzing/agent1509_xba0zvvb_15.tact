struct InnerChain {
    s: String = "x";
    opt: Int?;
    bool: Bool = false;
}

struct OuterChain {
    a: InnerChain;
    b: InnerChain;
}

contract ChainContract {
    d: OuterChain;
    init() {
        self.d = OuterChain{
            a: InnerChain{ s: "a", opt: null, bool: true },
            b: InnerChain{ s: "b", opt: 4, bool: false }
        };
    }
    receive() {
        let _ = self.d.b.opt;
    }
}