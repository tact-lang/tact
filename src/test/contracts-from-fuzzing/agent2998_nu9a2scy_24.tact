struct OverTen {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int?;
    f11: String?;
}

contract OverTenFields {
    data: OverTen;
    init() {
        self.data = OverTen{
            f1:1,f2:"a",f3:true,f4:null,f5:null,f6:null,f7:7,f8:"b",f9:false,f10:null,f11:"str"
        };
    }
}