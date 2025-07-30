struct ChainOpt {
    a: Int?;
    b: ChainOpt2?;
}

struct ChainOpt2 {
    x: Int?;
    y: Bool;
}

contract OptChainTest {
    val: ChainOpt;

    init() {
        self.val = ChainOpt{
            a: 42,
            b: ChainOpt2{
                x: null,
                y: true
            }
        };
    }
}
