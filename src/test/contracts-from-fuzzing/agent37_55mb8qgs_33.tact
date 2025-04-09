struct BigOpt {
    v01: Int?; v02: Int?; v03: Int?; v04: Int?;
    v05: Int?; v06: Int?; v07: Int?; v08: Int?;
    v09: Int?; v10: Int?; v11: Int?; v12: Int?;
    v13: Int?; v14: Int?; v15: Int?; v16: Int?;
}

contract ManyOpts {
    st: BigOpt;

    init() {
        self.st = BigOpt{
            v01:null,v02:null,v03:null,v04:null,
            v05:null,v06:null,v07:null,v08:null,
            v09:null,v10:null,v11:null,v12:null,
            v13:null,v14:null,v15:null,v16:null
        };
    }
}
