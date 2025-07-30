struct Small {
    val: Int;
}

struct Mid {
    s: Small;
}

struct Big {
    m: Mid;
}

contract MultiNest {
    big: Big;

    init() {
        self.big = Big{ m: Mid{ s: Small{ val: 42 } } };
    }
}