struct S1 {
    foo: Int?;
}

struct S2 {
    bar: S1?;
}

contract OptStructs {
    s2: S2;

    init() {
        self.s2 = S2{
            bar: S1{
                foo: null
            }
        };
    }
}