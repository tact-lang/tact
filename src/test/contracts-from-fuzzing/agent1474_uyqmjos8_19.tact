struct OptNest {
    first: Inner?;
}

struct Inner {
    second: Int?;
}

contract Test18 {
    n: OptNest;
    init() {
        self.n = OptNest{
            first: null
        };
    }
}