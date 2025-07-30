struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Slice?;
    h: Cell?;
    i: Address?;
}

contract ComboTest {
    s: Combo = Combo{
        a:1, b:null, c:true, d:null, e:"ok", f:null, g:null, h:null, i:null
    };
}