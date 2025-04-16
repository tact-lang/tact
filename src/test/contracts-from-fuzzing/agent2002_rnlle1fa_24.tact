struct Small {
    x: Int;
}

struct Mid {
    s: Small;
}

struct Big {
    m: Mid;
}

contract DeepChain {
    deep: Big;

    init() {
        self.deep = Big{ m: Mid{ s: Small{ x: 77 }}};
    }
}
