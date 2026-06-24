struct X {
    a: Int;
}

struct Y {
    a: Int;
    x: X;
}

struct Z {
    a: Int;
    y: Y;
}

contract ChainNamedFields {
    z: Z;

    init() {
        self.z = Z{ a: 1, y: Y{ a: 2, x: X{ a: 3 } } };
    }
}