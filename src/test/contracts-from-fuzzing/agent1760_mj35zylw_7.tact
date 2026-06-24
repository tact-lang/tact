struct Inner {
    f1: Int;
    f2: Bool?;
}

struct Mid {
    m1: Inner;
    m2: Inner?;
}

contract OptNested {
    d1: Mid?;

    init() {
        self.d1 = Mid{
            m1: Inner{f1: 1, f2: null},
            m2: Inner{f1: 2, f2: true}
        };
    }
}