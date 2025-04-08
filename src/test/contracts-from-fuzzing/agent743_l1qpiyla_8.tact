struct OptionalStructs {
    aa: String?;
    bb: Bool?;
    cc: Int?;
    dd: Address?;
    ee: Cell?;
    ff: Slice?;
    gg: String?;
    hh: Bool?;
    ii: Int?;
    jj: Address?;
}

contract ManyOptionals {
    opts: OptionalStructs;

    init() {
        self.opts = OptionalStructs{
            aa:null, bb:null, cc:null, dd:null, ee:null,
            ff:null, gg:null, hh:null, ii:null, jj:null
        };
    }
}