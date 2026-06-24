struct ChainA { b: ChainB }
struct ChainB { c: ChainC }
struct ChainC { val: Int }

contract DeepChain {
    f: ChainA;

    init() {
        self.f = ChainA{ b: ChainB{ c: ChainC{ val: 321 } } };
    }
}
