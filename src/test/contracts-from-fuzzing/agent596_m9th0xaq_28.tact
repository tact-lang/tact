struct ChainA { x: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }
struct ChainD { c: ChainC; }

contract ChainDepth4 {
    d: ChainD;

    init() {
        self.d = ChainD{
            c: ChainC{
                b: ChainB{
                    a: ChainA{
                        x: 123
                    }
                }
            }
        };
    }
}