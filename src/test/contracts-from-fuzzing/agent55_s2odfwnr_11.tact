struct X {
    a: Int = 1;
    b: Bool = false;
}

struct Y {
    c: String = "hello";
    d: Int?;
}

struct Z {
    e: X;
    f: Y;
}

contract MultiStructFields {
    z: Z;

    init() {
        self.z = Z{
            e: X{},
            f: Y{ c: "hello", d: null }
        };
    }
}
