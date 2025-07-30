struct ChainInner {
    x: Int;
}

struct ChainOuter {
    y: ChainInner;
}

contract ChainTest {
    data: ChainOuter;
    init() {
        self.data = ChainOuter{y: ChainInner{x:77}};
    }
}