struct Wide {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Int?;
    q: Bool?;
    r: String?;
    s: Int?;
    t: Bool?;
    u: String?;
    v: Int?;
    w: Bool?;
    x: String?;
    y: Int?;
    z: Bool?;
}

contract TestContract {
    w: Wide;

    init() {
        self.w = Wide{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,
            k:null,l:null,m:null,n:null,o:null,p:null,q:null,r:null,s:null,t:null,
            u:null,v:null,w:null,x:null,y:null,z:null
        };
    }
}