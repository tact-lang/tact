struct ChainA { a: Int; next: ChainB; }
struct ChainB { b: Int; next: ChainC; }
struct ChainC { c: Int; next: ChainD; }
struct ChainD { d: Int; }

contract Chain4Nest {
    root: ChainA;

    init() {
        self.root = ChainA{
            a: 1,
            next: ChainB{
                b: 2,
                next: ChainC{
                    c: 3,
                    next: ChainD{
                        d: 4,
                    },
                },
            }
        };
    }
}