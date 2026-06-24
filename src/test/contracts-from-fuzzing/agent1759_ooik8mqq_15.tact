struct X {
    a: Int;
}

struct Y {
    a: Int;
}

struct Z {
    first: X;
    second: Y;
}

contract StructOrder {
    z: Z;

    init() {
        self.z = Z{ first: X{ a:1 }, second: Y{ a:2 } };
    }
}
