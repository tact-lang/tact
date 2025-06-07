struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    combo: Combo = Combo{
        a:1, b:true, c:"str", d:null, e:false, f:null
    };
}