// very large struct with mixed types
struct BigMixed {
    i1: Int; b1: Bool; s1: String; a1: Address;
    c1: Cell; sl1: Slice; bu1: Builder;
    i2: Int?; b2: Bool?; s2: String?; a2: Address?;
    c2: Cell?; sl2: Slice?; bu2: Builder?;
}

contract Test {
    bm: BigMixed;

    init() {
        self.bm = BigMixed{
            i1:1, b1:true, s1:"s", a1:myAddress(),
            c1:emptyCell(), sl1:emptyCell().asSlice(), bu1:beginCell(),
            i2:null, b2:null, s2:null, a2:null,
            c2:null, sl2:null, bu2:null
        };
    }
}