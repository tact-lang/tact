struct R {
    x: Int = 11;
}

struct Q {
    r: R?;
    y: Bool = true;
}

struct P {
    q: Q?;
    z: Int?;
}

contract TestContract {
    p: P;
    init() {
        self.p = P{
            q: Q{
                r: R{x: 42},
                y: false
            },
            z: 100
        };
    }
}