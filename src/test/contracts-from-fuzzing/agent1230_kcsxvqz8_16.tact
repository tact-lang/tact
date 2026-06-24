struct ParamsA { a: Int; b: Int?; c: Bool; }
struct ParamsB { d: String; e: Bool?; f: Int; }
struct Combo {
    p1: ParamsA;
    p2: ParamsB;
    f: Bool;
}

contract ComplexNested {
    data: Combo;

    init() {
        self.data = Combo{
            p1: ParamsA{ a:1, b:null, c:true },
            p2: ParamsB{ d:"hi", e:null, f:42 },
            f: false
        };
    }
}