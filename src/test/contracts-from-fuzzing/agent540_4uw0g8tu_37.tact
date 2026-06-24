struct X {
    a: Int;
    b: Int?;
    c: Bool;
}

contract MixRootStructs {
    s1: X;
    s2: X;

    init() {
        self.s1 = X{ a: 1, b: null, c: true };
        self.s2 = X{ a: 2, b: null, c: false };
    }
}