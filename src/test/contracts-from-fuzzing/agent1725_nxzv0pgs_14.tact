struct SOpt {
    a: Int?;
}

struct OuterOpt {
    m1: SOpt?;
    m2: SOpt?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            m1: null,
            m2: SOpt{ a: 42 },
        };
    }
}