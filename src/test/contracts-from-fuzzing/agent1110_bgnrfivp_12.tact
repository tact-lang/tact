struct Combo {
    ival: Int as int64;
    uval: Int as uint4;
    bval: Bool;
    sval: String;
    oival: Int?;
    obval: Bool?;
    osval: String?;
}

contract ComboStore {
    comp: Combo;

    init() {
        self.comp = Combo{
            ival:12,
            uval:3,
            bval:true,
            sval:"hi",
            oival:null,
            obval:false,
            osval:"bye"
        };
    }
}