struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int?;
    f: String?;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;
}

contract LongStructPersistent {
    s: S1;
    init() {
        self.s = S1{
            a:1, b:true, c:"x", d:null, e:null,
            f:null, g:false, h:"y", i:42, j:true
        };
    }
}