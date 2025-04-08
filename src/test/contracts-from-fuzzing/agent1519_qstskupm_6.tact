struct Wide {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
}

contract WideStructTest {
    huge: Wide = Wide{
        a:1, b:2, c:true, d:false, e:3, f:true,
        g:4, h:false, i:5, j:true, k:6, l:false
    };

    init() {
        self.huge = Wide{
            a:10, b:20, c:true, d:true, e:30, f:false,
            g:40, h:true, i:50, j:false, k:60, l:true
        };
    }
}