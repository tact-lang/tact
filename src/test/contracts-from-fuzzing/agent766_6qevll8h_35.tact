// struct with many primitives and optionals combined
struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract Test {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1, b:null, c:true, d:false, e:"hi", f:null
        };
    }
}