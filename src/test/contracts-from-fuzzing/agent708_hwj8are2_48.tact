struct Combo {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int;
    f5: Bool;
    f6: String;
}

contract ComboOptReq {
    data: Combo;
    init() {
        self.data = Combo{
            f1:null,f2:null,f3:null,f4:42,f5:true,f6:"ok"
        };
    }
}