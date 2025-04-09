struct LongManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Int;
    i: Bool;
    j: String;
    k: Int?;
    l: Bool?;
    m: String?;
    n: Int;
    o: Bool;
    p: String;
    q: Int?;
    r: Bool?;
    s: String?;
    t: Int;
}

contract BigStructStorage {
    val: LongManyFields;

    init() {
        self.val = LongManyFields{
            a:1,b:2,c:true,d:"x",e:null,f:false,g:null,h:3,i:true,j:"y",
            k:null,l:true,m:null,n:4,o:false,p:"z",q:null,r:true,s:null,t:5
        };
    }
}