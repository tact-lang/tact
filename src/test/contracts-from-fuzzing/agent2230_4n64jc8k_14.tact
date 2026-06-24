struct ChainA { next: ChainB; val: Int; }
struct ChainB { next: ChainC; val: Int; }
struct ChainC { val: Int; }

contract LinearChain {
    data: ChainA;

    init() {
        self.data = ChainA{
            val: 1,
            next: ChainB{
                val: 2,
                next: ChainC{ val: 3 }
            }
        };
    }
}