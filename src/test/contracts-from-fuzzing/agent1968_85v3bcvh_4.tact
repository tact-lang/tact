struct WideOpt {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address?;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address?;
    f9: Int;
    f10: Bool;
}

contract Test5 {
    data: WideOpt;
    init() {
        self.data = WideOpt{
            f1:0,f2:true,f3:"a",f4:null,
            f5:1,f6:false,f7:"b",f8:null,
            f9:2,f10:true
        };
    }
}