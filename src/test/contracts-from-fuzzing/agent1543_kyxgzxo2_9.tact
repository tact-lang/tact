struct R {
    x: Int = 1;
}

struct Q {
    r: R?;
}

struct P {
    q: Q?;
}

contract TestContract {
    p: P;
    init() {
        self.p = P{
            q: null
        };
    }
}