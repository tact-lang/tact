struct Inner {
    f1: Int;
    f2: Bool;
}

struct Middle {
    s: Inner;
    flag: Bool;
}

struct Outer {
    mid: Middle;
    count: Int;
    active: Bool;
}

contract Complex {
    data: Outer;
    init() {
        self.data = Outer {
            mid: Middle { s: Inner { f1: 1, f2: false }, flag: true },
            count: 2,
            active: false
        };
    }
}