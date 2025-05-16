struct ChainA { a: Int }
struct ChainB { b: ChainA }
struct ChainC { c: ChainB }
struct ChainD { d: ChainC }

contract FourNestedLayers {
    s: ChainD;
    init() {
        self.s = ChainD{ d: ChainC{ c: ChainB{ b: ChainA{ a:99 } } } };
    }
}