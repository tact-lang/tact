struct X {
    v: Int = 1;
}

struct Y {
    s: String = "bar";
}

struct Z {
    f: Bool = true;
}

contract LotsOfDefaults {
    a: X;
    b: Y;
    c: Z;
    init() {
        self.a = X{};
        self.b = Y{};
        self.c = Z{};
    }
}