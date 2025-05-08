struct Wide {
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

contract WideStructTest {
    wide: Wide = Wide{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15,p:16
    };
    init() {
        self.wide = Wide{
            a:101,b:102,c:103,d:104,e:105,f:106,g:107,h:108,i:109,j:110,k:111,l:112,m:113,n:114,o:115,p:116
        };
    }
}
