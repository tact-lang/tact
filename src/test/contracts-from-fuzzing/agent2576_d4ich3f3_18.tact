struct Mega {
    a: Int;
    b: Bool;
    c: Int?;
    d: String?;
    e: String;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
}

contract ManyKindsNested {
    s: Mega;

    init() {
        self.s = Mega{
            a:1, b:true, c:null, d:null, e:"e", f:true, g:3, h:"h", i:false, j:7
        };
    }
}