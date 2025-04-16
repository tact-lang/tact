struct S1 {
    a: Int?;
}

struct S2 {
    s1: S1?;
}

contract ChainNulls {
    data: S2;
    init() {
        self.data = S2{
            s1: S1{ a: 10 }
        };
    }
}