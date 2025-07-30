struct ChainA { n: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }
struct ChainD { c: ChainC; }
struct ChainE { d: ChainD; }
struct ChainF { e: ChainE; }
struct ChainG { f: ChainF; }

contract LongChainNest {
    g: ChainG;

    init() {
        self.g = ChainG{ f: ChainF{ e: ChainE{ d: ChainD{ c: ChainC{ b: ChainB{ a: ChainA{ n: 5 } } } } } } };
    }
}