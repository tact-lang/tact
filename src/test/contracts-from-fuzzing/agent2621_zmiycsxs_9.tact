struct P {
    a: Int;
}

struct Q {
    b: P;
}

struct R {
    c: Q;
}

contract Test {
    d: R;
    init() {
        self.d = R{
            c: Q{
                b: P{
                    a: 42
                }
            }
        };
    }
}