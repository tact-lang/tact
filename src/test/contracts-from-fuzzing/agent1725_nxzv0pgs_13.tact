struct S {
    a: Int;
}

struct M1 {
    s: S;
}

struct M2 {
    s: S;
}

struct M3 {
    m1: M1;
    m2: M2;
}

contract TestContract {
    data: M3;

    init() {
        self.data = M3{
            m1: M1{
                s: S{a:1}
            },
            m2: M2{
                s: S{a:2}
            }
        };
    }
}