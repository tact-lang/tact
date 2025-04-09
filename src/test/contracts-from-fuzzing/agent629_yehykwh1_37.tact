struct S {
    a: Int;
}
contract Mix {
    f1: Int;
    f2: S;
    f3: Bool;
    f4: S;
    f5: Int;
    init() {
        self.f1 = 1;
        self.f2 = S{a:2};
        self.f3 = true;
        self.f4 = S{a:4};
        self.f5 = 5;
    }
}
