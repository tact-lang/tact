struct S {
    x: Int;
}

contract LargeRepeat {
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    f5: S;
    init() {
        self.f1 = S{ x: 1 };
        self.f2 = S{ x: 2 };
        self.f3 = S{ x: 3 };
        self.f4 = S{ x: 4 };
        self.f5 = S{ x: 5 };
    }
}