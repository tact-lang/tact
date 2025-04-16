struct Sub {
    i: Int;
}

struct Mid {
    s: Sub;
}

struct Root {
    a: Int;
    b: Mid;
    c: Bool;
    d: Sub;
}

contract TestContract {
    r: Root;

    init() {
        self.r = Root{
            a: 1,
            b: Mid{ s: Sub{ i: 2 } },
            c: true,
            d: Sub{ i: 3 }
        };
    }
}