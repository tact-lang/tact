struct ChainX {
    a: ChainY;
}

struct ChainY {
    b: ChainZ;
}

struct ChainZ {
    c: Int?;
}

contract ChainStore {
    foo: Int;
    x: ChainX;
    init() {
        self.foo = 0;
        self.x = ChainX{
            a: ChainY{
                b: ChainZ{ c: null }
            }
        };
    }
}