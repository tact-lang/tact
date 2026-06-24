struct S1 {
    x: Int;
}

struct S2 {
    y: Bool;
    sub: S1;
}

contract TestContract {
    val: S2 = S2{ y: false, sub: S1{ x: 0 } };

    init() {
        self.val = S2{ y: true, sub: S1{ x: 42 } };
    }
}