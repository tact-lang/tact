struct ChainA { x: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }
struct ChainD { c: ChainC; }

contract SerialChain {
    cc: ChainD;

    init() {
        self.cc = ChainD{ c: ChainC{ b: ChainB{ a: ChainA{ x: 5 } } } };
    }
}