struct S1 {
    n: Int?;
}

struct S2 {
    s: S1?;
}

contract NestedOptionalsUse {
    f: S2;

    init() {
        self.f = S2{ s: S1{ n: null } };
    }
}