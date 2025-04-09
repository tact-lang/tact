struct ChainA { val: Int; }
struct ChainB { next: ChainA; }
struct ChainC { next: ChainB; }
struct ChainD { next: ChainC; }

contract ChainStructs {
    chain: ChainD;

    init() {
        self.chain = ChainD{
            next: ChainC{
                next: ChainB{
                    next: ChainA{ val: 123 },
                },
            },
        };
    }
}