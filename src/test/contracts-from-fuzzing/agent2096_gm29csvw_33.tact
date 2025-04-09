struct W {
    a: Bool;
}

struct X {
    b: W;
}

struct Y {
    c: X;
}

struct Z {
    d: Y;
}

contract FourNestStorage {
    f: Z;
    init() {
        self.f = Z{ d: Y{ c: X{ b: W{ a: true } } } };
    }
}