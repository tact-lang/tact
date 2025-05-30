struct Massive {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Bool?;
    f6: Int;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: Int?;
    f11: Bool;
    f12: String;
    f13: Int;
    f14: Bool;
}

contract LotsOfFields {
    data: Massive;

    init() {
        self.data = Massive{
            f1:1,f2:true,f3:null,f4:"a",f5:false,
            f6:2,f7:"b",f8:true,f9:3,f10:4,
            f11:false,f12:"c",f13:5,f14:true
        };
    }
}