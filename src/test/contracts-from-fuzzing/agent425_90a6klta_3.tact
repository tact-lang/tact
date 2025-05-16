struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
    m: Int;
    n: Bool;
    o: Int?;
}

contract TestContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a:1, b:true, c:null, d:false, e:2, f:false, g:3, h:null,
            i:4, j:true, k:5, l:null, m:6, n:false, o:null
        };
    }
}