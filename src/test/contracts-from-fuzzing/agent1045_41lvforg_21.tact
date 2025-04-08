struct S {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
    e: Int as uint4;
    f: Int as uint4;
    g: Int as uint4;
    h: Int as uint4;
    i: Int as uint4;
    j: Int as uint4;
    k: Int as uint4;
    l: Int as uint4;
    m: Int as uint4;
    n: Int as uint4;
    o: Int as uint4;
    p: Int as uint4;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15,p:0
        };
    }
}