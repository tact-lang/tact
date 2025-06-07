struct S {
    a: Int;
    b: Bool;
}

contract Arranged1 {
    f1: S;
    f2: Int;
    f3: Bool;

    init() {
        self.f1 = S{a: 1, b: false};
        self.f2 = 2;
        self.f3 = true;
    }
}