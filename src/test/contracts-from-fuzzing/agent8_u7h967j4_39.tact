struct BigMix {
    i1: Int; b1: Bool; s1: String; c1: Cell; sl1: Slice; a1: Address;
    i2: Int?; b2: Bool?; s2: String?; c2: Cell?; sl2: Slice?; a2: Address?;
}

contract BigMixPersist {
    dat: BigMix;

    init() {
        self.dat = BigMix{
            i1:1,b1:true,s1:"hi",c1:emptyCell(),sl1:emptyCell().asSlice(),a1:myAddress(),
            i2:2,b2:false,s2:"bye",c2:emptyCell(),sl2:emptyCell().asSlice(),a2:myAddress()
        };
    }
}