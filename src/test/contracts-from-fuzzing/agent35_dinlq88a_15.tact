struct ManyFields {
    f01: Int?; f02: Bool; f03: String; f04: Int;
    f05: Bool?; f06: String?; f07: Int; f08: Bool;
    f09: String; f10: Int; f11: Bool?; f12: String?;
    f13: Int?; f14: Bool; f15: String; f16: Int;
    f17: Bool?; f18: String?; f19: Int; f20: Bool;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f01:null,f02:true,f03:"a",f04:1,
            f05:null,f06:null,f07:2,f08:false,
            f09:"b",f10:3,f11:null,f12:null,
            f13:null,f14:true,f15:"c",f16:4,
            f17:null,f18:null,f19:5,f20:false
        };
    }
}