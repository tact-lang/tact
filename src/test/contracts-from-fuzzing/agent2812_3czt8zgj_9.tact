struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: Int?;
    f: Bool;
    g: Int?;
    h: Bool;
    i: Int?;
    j: Bool;
    k: Int?;
    l: Bool;
    m: Int?;
    n: Bool;
    o: Int?;
    p: Bool;
    q: Int?;
    r: Bool;
    s: Int?;
    t: Bool;
    u: Int?;
    v: Bool;
    w: Int?;
    x: Bool;
    y: Int?;
    z: Bool;
}

contract LotsOfFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a:1,b:true,c:null,d:false,e:null,f:true,g:null,h:false,i:null,j:true,k:null,l:false,m:null,n:true,o:null,p:false,q:null,r:true,s:null,t:false,u:null,v:true,w:null,x:false,y:null,z:true
        };
    }
}