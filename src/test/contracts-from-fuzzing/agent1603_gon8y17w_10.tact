struct Deepest {
    x: Int;
}

struct Deeper {
    inner: Deepest;
}

struct Deep {
    mid: Deeper;
}

contract DeepChainTest {
    chain: Deep;

    init() {
        self.chain = Deep{
            mid: Deeper{
                inner: Deepest{ x: 99 }
            }
        };
    }
}