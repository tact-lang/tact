struct X {
    a: Int;
    b: Y;
}

struct Y {
    c: Int?;
    d: Z?;
}

struct Z {
    e: Bool;
}

contract CT {
    f: X;

    init() {
        self.f = X{
            a:5,
            b:Y{
                c:null,
                d:null
            }
        };
    }
}