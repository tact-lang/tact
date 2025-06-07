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
}

contract WideS {
    w: Wide = Wide{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
    };

    init() {
        self.w = Wide{
            a:10,b:9,c:8,d:7,e:6,f:5,g:4,h:3,i:2,j:1
        };
    }
}