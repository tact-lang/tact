struct S1 {
    f1: Int?;
    f2: Bool;
}

struct S2 {
    sf: S1;
}

contract OptionalInsideNested {
    x: S2;
    init() {
        self.x = S2{ sf: S1{ f1: null, f2: true } };
    }
}