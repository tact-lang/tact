struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String?;
    j: Int;
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool;
    r: String?;
    s: Int;
    t: Bool;
}

contract LargeStructHolder {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a:1,b:true,c:"c",d:null,e:false,f:"f",g:2,h:true,i:null,j:3,k:false,l:"l",
            m:4,n:true,o:"o",p:null,q:true,r:null,s:5,t:false
        };
    }
}
