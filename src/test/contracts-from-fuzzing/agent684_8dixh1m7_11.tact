struct Tiny {
    a: Int;
}

struct Small {
    t: Tiny;
}

contract MinimalNested {
    s: Small;
    init() {
        self.s = Small {
            t: Tiny { a: 1 }
        };
    }
}