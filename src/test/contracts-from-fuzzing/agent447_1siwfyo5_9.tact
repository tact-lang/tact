struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptFields {
    f1: ManyOptionals;
    f2: ManyOptionals?;
    f3: Int?;
    
    init() {
        self.f1 = ManyOptionals{ a:null,b:null,c:null,d:null,e:null,f:null };
        self.f2 = null;
        self.f3 = null;
    }
}