struct Combo {
    optInt: Int?;
    boolFlag: Bool;
    strOpt: String?;
    addr: Address;
}

contract CombineOptionalNormal {
    combo: Combo;
    init() {
        self.combo = Combo{
            optInt:null,
            boolFlag:true,
            strOpt:null,
            addr:myAddress()
        };
    }
}