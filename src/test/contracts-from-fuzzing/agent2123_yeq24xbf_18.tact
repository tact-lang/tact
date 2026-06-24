struct Sub {
    a: Int;
}

struct Mid {
    sub: Sub;
    b: Bool;
}

struct Top {
    mid: Mid;
    n: Int;
    optMid: Mid?;
}

contract NestedOptionals {
    s: Top;

    init() {
        self.s = Top{
            mid: Mid{ sub: Sub{a:1}, b:true },
            n: 2,
            optMid: null
        };
    }
}