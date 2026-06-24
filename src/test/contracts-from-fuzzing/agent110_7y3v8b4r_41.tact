struct S {
    f1: Int;
    f2: Int;
    f3: Int;
}

contract InitOverrideDefaults {
    s: S;

    init() {
        self.s = S{ f1: 11, f2: 22, f3: 33 };
    }
}