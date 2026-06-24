struct MidO {
    x: Bool;
}

struct OuterO {
    opt: MidO?;
    y: Int;
}

contract OptOutside {
    f: OuterO;
    init() {
        self.f = OuterO{ opt:null, y:5 };
    }
}