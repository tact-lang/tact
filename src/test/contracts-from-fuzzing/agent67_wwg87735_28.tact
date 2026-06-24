// test excessive number of fields
struct ManyFields {
    f01: Int;
    f02: Bool;
    f03: Int?;
    f04: Bool?;
    f05: String;
    f06: Int;
    f07: Bool;
    f08: Int?;
    f09: Bool?;
    f10: String;
    f11: Int;
    f12: Bool;
    f13: Int?;
    f14: Bool?;
    f15: String;
    f16: Int;
    f17: Bool;
    f18: Int?;
    f19: Bool?;
    f20: String;
}

contract MonsterStruct {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f01:1, f02:true, f03:null, f04:false, f05:"s",
            f06:6, f07:false, f08:8, f09:null, f10:"ten",
            f11:11, f12:true, f13:null, f14:true, f15:"fifteen",
            f16:16, f17:false, f18:null, f19:true, f20:"twenty"
        };
    }
}
