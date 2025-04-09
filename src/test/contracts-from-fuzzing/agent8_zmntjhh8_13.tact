struct X {
    a: Int;
}

struct Y {
    b: X;
    c: Int;
}

struct Z {
    d: Y;
    e: Bool;
}

contract DeepFields {
    z: Z;

    init() {
        self.z = Z{
            d: Y{
                b: X{
                    a: 1
                },
                c: 2
            },
            e: true
        };
    }
}