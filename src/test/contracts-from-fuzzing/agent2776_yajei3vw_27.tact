struct ChainA { next: ChainB }
struct ChainB { next: ChainC }
struct ChainC { val: Int }

contract ChainTest {
    chain: ChainA;

    init() {
        self.chain = ChainA{ next: ChainB{ next: ChainC{ val: 1 } } };
    }
}
