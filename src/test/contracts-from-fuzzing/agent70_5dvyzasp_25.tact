struct S1 {
    a: Int?;
}

struct S2 {
    s1: S1;
    b: Bool?;
}

contract Test {
    var: S2;

    init() {
        self.var = S2{
            s1: S1{ a:null },
            b: null
        };
    }
}