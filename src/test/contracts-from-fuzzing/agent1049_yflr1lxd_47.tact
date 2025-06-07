struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
    e: Bool?;
    f: Int;
    g: Int?;
    h: Int;
    i: String;
    j: Bool;
    k: Int?;
    l: String?;
    m: Bool?;
    n: Int;
    o: Int?;
    p: Int;
    q: String;
    r: Bool;
    s: Int?;
    t: String?;
}

contract LotsOfFields {
    field: LargeStruct;

    init() {
        self.field = LargeStruct {
            a:1,b:true,c:null,d:"x",e:false,f:2,g:3,h:4,i:"y",
            j:true,k:null,l:null,m:null,n:5,o:6,p:7,q:"z",
            r:false,s:null,t:null
        };
    }
}