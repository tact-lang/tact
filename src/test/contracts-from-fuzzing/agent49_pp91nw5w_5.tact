struct D {
    d1: Int;
}

struct E {
    e1: D;
}

struct F {
    f1: E;
}

struct G {
    g1: F;
}

contract DeepChain {
    var: G;

    init() {
        self.var = G{g1: F{f1: E{e1: D{d1: 999}}}};
    }
}