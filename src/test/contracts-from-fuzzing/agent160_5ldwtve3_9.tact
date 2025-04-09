struct OptNest {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    c: Int?;
}

contract TestOptNest {
    data: OptNest;
    init() {
        self.data = OptNest{
            a: null,
            b: null,
        };
    }
}