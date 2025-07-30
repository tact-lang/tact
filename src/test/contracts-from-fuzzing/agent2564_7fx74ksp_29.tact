struct ChainA { val: Int }
struct ChainB { a: ChainA }
struct ChainC { b: ChainB }
struct ChainD { c: ChainC }
struct ChainE { d: ChainD }

contract MultiChain {
    storage: ChainE;

    init() {
        self.storage = ChainE{ d: ChainD{ c: ChainC{ b: ChainB{ a: ChainA{ val: 1 } } } } };
    }
}