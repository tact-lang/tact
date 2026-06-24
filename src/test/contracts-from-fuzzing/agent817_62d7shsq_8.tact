struct ChainA {
    next: ChainB;
    val: Int;
}

struct ChainB {
    next: ChainC;
    val: String;
}

struct ChainC {
    val: Bool;
}

contract ChainTest {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    val: true,
                },
                val: "ok",
            },
            val: 99,
        };
    }
}