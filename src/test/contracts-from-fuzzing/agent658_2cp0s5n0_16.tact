struct S {
    a: Int;
    b: Bool;
}

contract Arranged3 {
    f1: Int;
    f2: Bool;
    f3: S;

    init() {
        self.f1 = 2;
        self.f2 = true;
        self.f3 = S{a: 1, b: false};
    }
}