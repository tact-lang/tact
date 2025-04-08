struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract DiverseFields {
    s: S;

    init() {
        self.s = S{
            a:1, b:null, c:true, d:false, e:"str", f:null
        };
    }
}