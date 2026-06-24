struct NumerousOpts {
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
    k: Bool?;
    l: Bool?;
    m: Bool?;
    n: Bool?;
    o: Bool?;
    p: Bool?;
    q: Bool?;
    r: Bool?;
    s: Bool?;
    t: Bool?;
}

contract TestContract {
    flags: NumerousOpts;

    init() {
        self.flags = NumerousOpts{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,
            k:null,l:null,m:null,n:null,o:null,p:null,q:null,r:null,s:null,t:null
        };
    }
}