struct S {
    f: Int?;
}

contract ComplexOpt {
    f1: S?;
    f2: S;

    init() {
        self.f1 = null;
        self.f2 = S{f: null};
    }
}