// Complex nested multi-level, mixed optional fields
struct Bottom {
    val: Int;
    opt: Bool?;
}

struct Middle {
    a: Bottom?;
    b: Int;
    c: String?;
}

contract ComplexMix {
    m: Middle;
    a: Int?;
    b: Bool;

    init() {
        self.m = Middle{a:null, b:1, c:null};
        self.a = null;
        self.b = true;
    }
}