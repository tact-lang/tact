struct Combo {
    a: Int as uint1;
    b: Bool;
    c: Bool?;
    d: Int?;
    e: String;
    f: String?;
}

contract TestContract {
    c: Combo = Combo{
        a:1, b:true, c:null, d:null, e:"hi", f:null
    };
}
