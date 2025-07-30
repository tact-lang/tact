struct Tiny {
    q: Bool;
}

struct Small {
    a: Tiny;
    b: Bool;
}

struct Medium {
    a: Small;
    b: Tiny;
    c: Bool;
}

contract NestedMixed {
    mm: Medium;
    init() {
        self.mm = Medium{
            a: Small{
                a: Tiny{ q: true },
                b: false,
            },
            b: Tiny{ q: true },
            c: false,
        };
    }
}