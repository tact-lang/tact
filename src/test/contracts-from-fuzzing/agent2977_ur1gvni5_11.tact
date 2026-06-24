struct X {
    a: Int?;
}

struct Y {
    b: X?;
}

struct Z {
    c: Y?;
}

contract OptionalDeep {
    data: Z;
    init() {
        self.data = Z{ c: null };
    }
}