struct HasManyDiffOpt {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract MixedManyOpts {
    f: HasManyDiffOpt;

    init() {
        self.f = HasManyDiffOpt{
            optInt:null,optBool:null,optStr:null,optAddr:null,optCell:null,optSlice:null
        };
    }
}