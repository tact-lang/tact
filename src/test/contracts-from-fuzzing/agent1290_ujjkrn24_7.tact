struct BigStruct {
    f1: Int; f2: Bool; f3: Int?; f4: Bool?;
    f5: Int; f6: Bool; f7: Int?; f8: Bool?;
    f9: Int; f10: Bool; f11: Int?; f12: Bool?;
    f13: Int; f14: Bool; f15: Int?; f16: Bool?;
    f17: Int; f18: Bool; f19: Int?; f20: Bool?;
    f21: Int; f22: Bool; f23: Int?; f24: Bool?;
}

contract BigStructTest {
    storage: BigStruct;
    init() {
        self.storage = BigStruct{
            f1:1,f2:true,f3:null,f4:false,
            f5:2,f6:false,f7:7,f8:true,
            f9:3,f10:true,f11:null,f12:null,
            f13:4,f14:false,f15:15,f16:false,
            f17:5,f18:true,f19:null,f20:true,
            f21:6,f22:false,f23:23,f24:true
        };
    }
}