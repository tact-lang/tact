struct S {
    s1: Int;
}

contract TestRepeatFields {
    f1: S;
    f2: S;
    f3: S;

    init() {
        self.f1 = S{ s1: 1 };
        self.f2 = S{ s1: 2 };
        self.f3 = S{ s1: 3 };
    }
}