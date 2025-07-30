struct Sub {
    foo: Int;
}

struct Mid {
    sub: Sub;
    bar: Bool;
}

contract MixedOrder {
    b1: Bool;
    m: Mid;
    i1: Int;

    init() {
        self.b1 = true;
        self.m = Mid{ sub: Sub{ foo: 5 }, bar: false };
        self.i1 = 10;
    }
}