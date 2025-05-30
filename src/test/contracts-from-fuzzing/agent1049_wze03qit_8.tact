struct ChainA { next: ChainB?; a: Int; }
struct ChainB { next: ChainC?; b: Int; }
struct ChainC { next: ChainD?; c: Int; }
struct ChainD { next: ChainE?; d: Int; }
struct ChainE { e: Int; }

contract TestContract {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    next: null,
                    c: 3
                },
                b: 2
            },
            a: 1
        };
    }
}