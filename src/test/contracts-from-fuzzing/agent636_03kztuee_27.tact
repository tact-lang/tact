struct ChainA { a: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }
struct ChainD { c: ChainC; }
struct ChainE { d: ChainD; }
struct ChainF { e: ChainE; }
struct ChainG { f: ChainF; }

contract DeepChain7 {
    data: ChainG;

    init() {
        self.data = ChainG{ f: ChainF{ e: ChainE{ d: ChainD{ c: ChainC{ b: ChainB{ a: ChainA{ a:42 } } } } } } };
    }
}
