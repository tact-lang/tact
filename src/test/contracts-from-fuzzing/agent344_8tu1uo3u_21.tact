struct ChainA { x: Int; }
struct ChainB { a: ChainA; }
struct ChainC { b: ChainB; }
struct ChainD { c: ChainC; }
struct ChainE { d: ChainD; }

contract Chain {
 val: ChainE = ChainE{ d: ChainD{ c: ChainC{ b: ChainB{ a: ChainA{ x: 99 }}}}};
}