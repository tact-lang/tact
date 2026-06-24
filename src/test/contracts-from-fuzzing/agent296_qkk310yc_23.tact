struct I {
    a: Int;
}

struct J {
    b: I;
}

struct K {
    c: J;
}

contract DeepStacked {
    nested: K;

    init() {
        self.nested = K{
            c: J{
                b: I{
                    a: 123
                }
            }
        };
    }
}
