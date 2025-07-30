struct ManyPrimitives {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: Bool;
    p: Bool;
    q: Bool;
    r: Bool;
    s: Bool;
    t: Bool;
}

contract TestContract {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:true,l:false,m:true,n:false,o:true,p:false,q:true,r:false,s:true,t:false
        };
    }
}