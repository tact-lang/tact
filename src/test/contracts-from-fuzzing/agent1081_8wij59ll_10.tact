struct LongStruct {
    f1: Int; f2: Int; f3: Bool; f4: String;
    f5: Bool?; f6: Int?; f7: String?; f8: Bool;
    f9: Int; f10: String; f11: Int; f12: Bool;
}

contract LongFields {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            f1:1,f2:2,f3:true,f4:"x",f5:null,f6:null,f7:null,f8:false,
            f9:9,f10:"y",f11:11,f12:true
        };
    }
}