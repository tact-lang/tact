struct Large {
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
    q: Int;
    r: Int;
    s: Int;
    t: Int;
    u: Int;
    v: Int;
    w: Int;
    x: Int;
    y: Int;
    z: Int;
    aa: Int;
    bb: Int;
    cc: Int;
    dd: Int;
    ee: Int;
    ff: Int;
}

contract LargeStructTest {
    field: Large = Large{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20,u:21,v:22,w:23,x:24,y:25,z:26,
        aa:27,bb:28,cc:29,dd:30,ee:31,ff:32
    };

    init() {
        self.field = Large{
            a:32,b:31,c:30,d:29,e:28,f:27,g:26,h:25,i:24,j:23,k:22,l:21,m:20,n:19,o:18,p:17,q:16,r:15,s:14,t:13,u:12,v:11,w:10,x:9,y:8,z:7,
            aa:6,bb:5,cc:4,dd:3,ee:2,ff:1
        };
    }
}