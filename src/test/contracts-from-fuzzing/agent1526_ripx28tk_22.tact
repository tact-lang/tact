struct S1 {
    a: Int?;
}

struct S2 {
    b: S1?;
}

contract StructOptionChain {
    v: S2;

    init() {
        self.v = S2{
            b: S1{
                a: null
            }
        };
    }
}