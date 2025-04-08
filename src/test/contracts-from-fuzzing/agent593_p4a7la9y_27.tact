struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    c: String?;
}

contract MixNestedOpt {
    f: S2;

    init() {
        self.f = S2{
            s1: S1{
                a: 5,
                b: true
            },
            c: null
        };
    }
}