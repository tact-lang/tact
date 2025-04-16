struct ChainA { b: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }

contract DeepChain {
    c: ChainC;

    init() {
        self.c = ChainC{
            b: ChainB{
                a: ChainA{ b: 10 }
            }
        };
    }
}