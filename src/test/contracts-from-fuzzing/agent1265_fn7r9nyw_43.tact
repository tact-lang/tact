struct NestedChain {
    a: Int;
    next: ChainMid?;
}

struct ChainMid {
    b: Int;
    next: ChainLeaf?;
}

struct ChainLeaf {
    c: Int;
}

contract ChainContract {
    top: NestedChain;

    init() {
        self.top = NestedChain{
            a:1, next:null
        };
    }
}