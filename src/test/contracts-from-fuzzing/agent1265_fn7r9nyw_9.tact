struct BigNested {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: Int?;
    f: Bool;
    g: String?;
    h: Bool;
    i: Int?;
}

contract HasMany {
    n1: BigNested;
    n2: BigNested;

    init() {
        self.n1 = BigNested{
            a:1,b:true,c:null,d:"",e:null,f:false,g:null,h:true,i:null
        };
        self.n2 = BigNested{
            a:2,b:false,c:null,d:"test",e:null,f:true,g:null,h:false,i:null
        };
    }
}