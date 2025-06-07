struct L {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
}

contract LargeStruct {
    s: L;

    init() {
        self.s = L{
            a:1, b:true, c:null, d:"hi", e:null, f:null,
            g:7, h:false, i:100, j:true
        };
    }
}
