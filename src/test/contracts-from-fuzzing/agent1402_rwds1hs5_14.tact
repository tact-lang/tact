struct Small {
    a: Int;
}

struct Mid {
    s: Small;
}

struct Big {
    m: Mid;
}

contract OptOuter {
    data: Big?;

    init() {
        self.data = Big{ m: Mid{ s: Small{ a:5 } } };
    }
}