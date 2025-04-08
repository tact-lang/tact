struct ComplexOptionalDeep {
    a: Int?;
    b: Sub1?;
}

struct Sub1 {
    c: Sub2?;
}

struct Sub2 {
    d: Int?;
    e: Sub3?;
}

struct Sub3 {
    f: Int?;
}

contract TestContract {
    co: ComplexOptionalDeep;

    init() {
        self.co = ComplexOptionalDeep{
            a: null,
            b: Sub1 {
                c: Sub2 {
                    d: null,
                    e: Sub3 { f:null }
                }
            }
        };
    }
}