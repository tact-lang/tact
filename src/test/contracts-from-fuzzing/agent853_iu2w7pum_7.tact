struct WideStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool?;
    f8: String;
    f9: Int?;
    f10: Bool;
    f11: Int;
    f12: String;
}

contract WideStructTest {
    s: WideStruct;

    init() {
        self.s = WideStruct{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:true,f7:null,f8:"x",f9:null,f10:false,f11:11,f12:"y",
        };
    }
}