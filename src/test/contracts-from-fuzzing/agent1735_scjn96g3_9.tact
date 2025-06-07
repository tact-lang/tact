struct Tiny {
    a: Bool;
}

struct Small {
    a: Tiny;
    b: Int;
}

struct Medium {
    x: Small;
    y: Small;
}

contract TestContract {
    m: Medium;

    init() {
        self.m = Medium{
            x: Small{ a: Tiny{a: true}, b: 1 },
            y: Small{ a: Tiny{a: false}, b: 2 }
        };
    }
}
