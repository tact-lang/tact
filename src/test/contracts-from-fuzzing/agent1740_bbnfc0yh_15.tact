struct Seq {
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
    k: Int;
    l: Int;
    m: Int;
    n: Int;
    o: Int;
    p: Int;
}

contract ManyFields {
    f: Seq = Seq{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15,p:16
    };

    init() {
        self.f = Seq{
            a:16,b:15,c:14,d:13,e:12,f:11,g:10,h:9,i:8,j:7,k:6,l:5,m:4,n:3,o:2,p:1
        };
    }
}