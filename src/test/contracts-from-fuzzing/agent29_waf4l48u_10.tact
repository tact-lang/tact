struct X {
    a: Int;
}

struct Y {
    b: Bool;
}

struct Z {
    c: Address;
}

contract MultiStructs {
    s1: X;
    s2: Y;
    s3: Z;
    init() {
        self.s1 = X{a: 10};
        self.s2 = Y{b: true};
        self.s3 = Z{c: myAddress()};
    }
}
