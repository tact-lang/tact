struct S0 {
    s1: S1;
    s2: S1?;
}

struct S1 {
    v1: Int;
    v2: Bool;
}

contract Test {
    data: S0;

    init() {
        self.data = S0{
            s1: S1{v1: 5, v2: false},
            s2: null,
        };
    }
}