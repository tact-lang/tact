struct S {
    a: Int;
    b: Bool;
}

contract Arranged2 {
    f1: Int;
    f2: S;
    f3: Bool;

    init() {
        self.f1 = 2;
        self.f2 = S{a: 1, b: false};
        self.f3 = true;
    }
}