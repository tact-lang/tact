struct HugeStruct {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Int?;
    f05: Bool?;
    f06: String?;
    f07: Int;
    f08: Bool;
    f09: String;
    f10: Int?;
    f11: Bool?;
    f12: String?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Int;
    f20: Bool;
    f21: String;
    f22: Int?;
    f23: Bool?;
    f24: String?;
}

contract UseHugeStruct {
    h: HugeStruct;

    init() {
        self.h = HugeStruct{
            f01:1,f02:true,f03:"a",f04:null,f05:null,f06:null,
            f07:2,f08:true,f09:"b",f10:null,f11:null,f12:null,
            f13:3,f14:true,f15:"c",f16:null,f17:null,f18:null,
            f19:4,f20:true,f21:"d",f22:null,f23:null,f24:null
        };
    }
}
