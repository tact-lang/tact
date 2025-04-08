struct Tiny {
    a: Int;
}

struct Small {
    x: Tiny;
}

struct Mid {
    y: Small;
}

struct Big {
    z: Mid;
}

contract DeepSingular {
    field: Big;

    init() {
        self.field = Big{ z: Mid{ y: Small{ x: Tiny{ a: 7 } } } };
    }
}