struct ManyMany {
    f1: Int; f2: Int;
    f3: Bool; f4: Bool;
    f5: String; f6: String;
    f7: Address; f8: Address;
    f9: Int?; f10: Int?;
    f11: Bool?; f12: Bool?;
    f13: String?; f14: String?;
    f15: Address?; f16: Address?;
}

contract MaxVariety {
    m: ManyMany;

    init() {
        self.m = ManyMany{
            f1:1,f2:2,f3:true,f4:false,
            f5:"a",f6:"b",f7:myAddress(),f8:myAddress(),
            f9:null,f10:null,f11:null,f12:null,
            f13:null,f14:null,f15:null,f16:null
        };
    }
}