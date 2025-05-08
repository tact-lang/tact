struct S1 {
    a: Int?;
    b: Bool?;
}

struct S2 {
    s1: S1?;
    c: Int;
}

contract ChainOptionals {
    data: S2;
    init() {
        self.data = S2{
            s1: null,
            c: 77
        };
    }
}