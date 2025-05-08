struct TinyNested {
    ok: Bool;
}

struct MidNested {
    tn: TinyNested;
    name: String?;
}

contract OptMid {
    nested: MidNested?;

    init() {
        self.nested = null;
    }
}
