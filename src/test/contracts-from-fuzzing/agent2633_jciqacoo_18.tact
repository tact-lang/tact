struct SBig {
    x1: Int; x2: Int; x3: Int;
    b1: Bool; b2: Bool; b3: Bool;
    s1: String; s2: String; s3: String;
    a1: Address; a2: Address; a3: Address;
    c1: Cell; c2: Cell; c3: Cell;
    sl1: Slice; sl2: Slice; sl3: Slice;
    ox1: Int?; ox2: Int?; ox3: Int?;
    ob1: Bool?; ob2: Bool?; ob3: Bool?;
    os1: String?; os2: String?; os3: String?;
    oa1: Address?; oa2: Address?; oa3: Address?;
    oc1: Cell?; oc2: Cell?; oc3: Cell?;
    osl1: Slice?; osl2: Slice?; osl3: Slice?;
}

contract BigFields {
    dat: SBig;

    init() {
        self.dat = SBig{
            x1:1, x2:2, x3:3,
            b1:true, b2:false, b3:true,
            s1:"a", s2:"b", s3:"c",
            a1:myAddress(), a2:myAddress(), a3:myAddress(),
            c1:emptyCell(), c2:emptyCell(), c3:emptyCell(),
            sl1:emptyCell().asSlice(), sl2:emptyCell().asSlice(), sl3:emptyCell().asSlice(),
            ox1:null, ox2:null, ox3:null,
            ob1:null, ob2:null, ob3:null,
            os1:null, os2:null, os3:null,
            oa1:null, oa2:null, oa3:null,
            oc1:null, oc2:null, oc3:null,
            osl1:null, osl2:null, osl3:null,
        };
    }
}
