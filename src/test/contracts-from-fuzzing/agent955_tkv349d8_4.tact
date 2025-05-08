struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int as uint8;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract WideFieldsTest {
    wide: WideStruct;

    init() {
        self.wide = WideStruct{
            f1:1,f2:true,f3:"a",f4:2,f5:null,f6:null,f7:3,f8:false,f9:"b",f10:4
        };
    }
}