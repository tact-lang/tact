struct S1 {
    foo: Int?;
}

struct S2 {
    bar: Bool?;
}

contract TestContract {
    f1: Int?;
    f2: S1?;
    f3: S2?;
    f4: Bool?;
    f5: Address?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
        self.f5 = null;
    }
}