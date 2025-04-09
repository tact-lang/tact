struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    x: Int;
    y: Bool;
}

contract TestContract {
    state: S2;

    init() {
        self.state = S2{ s1: S1{ a: 3, b: true }, x: 5, y: false };
    }
}