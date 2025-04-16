struct InnerMost {
    a: Int;
}

struct Mid1 {
    x: Bool;
    inner: InnerMost;
}

struct Mid2 {
    y: Bool;
    mid1: Mid1;
}

struct OuterMost {
    z: Int;
    mid2: Mid2;
}

contract ComplexDeepNest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            z: 1,
            mid2: Mid2{
                y: true,
                mid1: Mid1{
                    x: false,
                    inner: InnerMost{ a: 42 }
                }
            }
        };
    }
}