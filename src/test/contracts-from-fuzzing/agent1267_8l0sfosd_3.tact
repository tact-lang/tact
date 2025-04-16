struct TenFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract LotsOfPrimitiveFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: TenFields;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = null;
        self.f5 = "hi";
        self.f6 = null;
        self.f7 = TenFields{
            a:1,b:true,c:"a",d:null,e:null,f:null,g:2,h:false,i:"b",j:null
        };
    }
}

contract Use {
    receive() {
        let dummy: LotsOfPrimitiveFields? = null;
    }
}