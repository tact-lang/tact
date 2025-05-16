struct S { x: Int }

contract TestContract {
    a: Int;
    s1: S;
    b: Bool;
    s2: S;

    init() {
        self.a = 5;
        self.s1 = S{ x: 10 };
        self.b = false;
        self.s2 = S{ x: 20 };
    }
}