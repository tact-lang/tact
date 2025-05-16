struct BigMixed {
    i1: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    sl1: Slice;
    a1: Address;
    i2: Int?;
    b2: Bool?;
    s2: String?;
    c2: Cell?;
    sl2: Slice?;
    a2: Address?;
}

contract MixedDataContract {
    fld: BigMixed;

    init() {
        self.fld = BigMixed{
            i1:1,b1:true,s1:"x",c1:emptyCell(),sl1:emptyCell().asSlice(),a1:myAddress(),
            i2:null,b2:null,s2:null,c2:null,sl2:null,a2:null
        };
    }
}
