struct Combo {
    a: Int; 
    b: Int as uint32;
    c: Int?;
    d: Bool?;
    e: String;
    f: Bool;
}

contract ComboFields {
    s: Combo;

    init() {
        self.s = Combo{
            a:1,b:2,c:null,d:true,e:"ok",f:false
        };
    }
}