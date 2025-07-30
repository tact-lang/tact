struct X {
    a: Int;
}

struct Y {
    b: X;
}

struct Z {
    c: Y;
}

contract DeepStacked {
    field: Z;
    init() {
        self.field = Z {
            c: Y {
                b: X {
                    a: 77
                }
            }
        };
    }
}