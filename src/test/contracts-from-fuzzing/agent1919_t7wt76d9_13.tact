struct S1 {
    a: Int?;
}

struct S2 {
    s1opt: S1?;
}

contract TestContract {
    deepOpt: S2;
    init() {
        self.deepOpt = S2{
            s1opt: null
        };
    }
}