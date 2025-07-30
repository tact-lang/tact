struct VeryLongStruct {
    f1: Int;
    f2: Bool;
    f3: Int as uint8;
    f4: String;
    f5: Bool;
    f6: Int;
    f7: Int as uint8;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: Int;
    f13: String;
    f14: Int as uint8;
    f15: Bool;
    f16: Int;
    f17: String;
    f18: Bool;
    f19: Int;
    f20: String;
    f21: Bool;
    f22: Int as uint8;
    f23: String;
    f24: Int;
    f25: Bool;
    f26: String;
    f27: Int;
    f28: Bool;
    f29: String;
    f30: Int;
    f31: Bool;
}

contract BigStructStore {
    data: VeryLongStruct;

    init() {
        self.data = VeryLongStruct{
            f1:1,f2:true,f3:3,f4:"a",f5:false,f6:6,f7:7,f8:true,f9:"b",f10:10,
            f11:false,f12:12,f13:"c",f14:14,f15:true,f16:16,f17:"d",f18:false,f19:19,f20:"e",
            f21:true,f22:22,f23:"f",f24:24,f25:false,f26:"g",f27:27,f28:true,f29:"h",f30:30,f31:false
        };
    }
}