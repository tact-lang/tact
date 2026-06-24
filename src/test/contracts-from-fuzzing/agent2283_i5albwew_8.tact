struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Address?;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Address;
    f13: Int?;
    f14: Bool?;
    f15: String?;
    f16: Address?;
}

contract WideStructContract {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f1:1,f2:true,f3:"3",f4:myAddress(),
            f5:null,f6:null,f7:null,f8:null,
            f9:9,f10:true,f11:"11",f12:myAddress(),
            f13:null,f14:null,f15:null,f16:null
        };
    }
}
