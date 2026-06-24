struct BigOptionalStruct {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract BigOptional {
    s: BigOptionalStruct = BigOptionalStruct{
        a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
    };

    init() {
        self.s.a = 1;
        self.s.e = 5;
        self.s.j = 10;
    }
}