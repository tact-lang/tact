struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComboFields {
    data: Combo;
    init() {
        self.data = Combo{
            a:1,b:true,c:"hello",d:null,e:false,f:null
        };
    }
}