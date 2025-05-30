struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: Int?;
    f10: Bool?;
    f11: String;
    f12: Int;
}

contract LotsOfFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1,
            f2:true,
            f3:null,
            f4:"a",
            f5:false,
            f6:"b",
            f7:7,
            f8:false,
            f9:null,
            f10:null,
            f11:"c",
            f12:12,
        };
    }
}