struct D2 {
    v1: Int;
}

struct D1 {
    n: D2;
}

struct S {
    a: D1;
}

contract TestFuzz {
    s: S;

    init() {
        self.s = S{
            a: D1{ n: D2{v1:99} },
        };
    }
}