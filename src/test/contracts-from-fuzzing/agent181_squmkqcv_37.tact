struct S {
    a: Int;
    b: Bool?;
}

contract ComboBoth {
    f1: S;
    f2: S?;

    init() {
        self.f1 = S{ a:1, b: null };
        self.f2 = null;
    }
}
