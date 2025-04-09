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
}

contract Test {
    x: Wide;
    y: Wide;

    init() {
        self.x = Wide{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15};
        self.y = Wide{a:16,b:17,c:18,d:19,e:20,f:21,g:22,h:23,i:24,j:25,k:26,l:27,m:28,n:29,o:30};
    }
}