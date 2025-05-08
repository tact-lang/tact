struct ChainA { a: Int; }
struct ChainB { b: ChainA; }
struct ChainC { c: ChainB; }
struct ChainD { d: ChainC; }
struct ChainE { e: ChainD; }

contract FiveDeepStruct {
    val: ChainE;
    init() {
        self.val = ChainE{ e: ChainD{ d: ChainC{ c: ChainB{ b: ChainA{ a:77 } } } } };
    }
}