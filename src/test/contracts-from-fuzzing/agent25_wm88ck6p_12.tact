struct X {
    f1: Int;
    f2: Bool;
}

contract TestContract {
    s1: X;
    s2: X;

    init() {
        self.s1 = X{ f1: 1, f2: true };
        self.s2 = X{ f1: 2, f2: false };
    }
}