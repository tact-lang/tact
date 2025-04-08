struct Tiny {
    a: Int;
}

struct Small {
    x: Int;
    inside: Tiny;
}

contract ChainNested {
    nested: Small;

    init() {
        self.nested = Small{ x: 9, inside: Tiny{a:1} };
    }
}