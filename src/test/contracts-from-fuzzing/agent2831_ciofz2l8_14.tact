struct X {
    a: Int?;
    b: Bool?;
}

struct Y {
    c: String?;
    d: Int;
}

struct Z {
    s: X;
    t: Y;
}

contract MixOpt {
    val: Z;

    init() {
        self.val = Z{
            s: X{a: null, b: null},
            t: Y{c: null, d: 100}
        };
    }
}
