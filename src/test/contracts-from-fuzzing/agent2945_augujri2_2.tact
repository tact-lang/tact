struct S2 {
    x: Int;
    y: Bool;
}

struct S1 {
    f1: S2;
    f2: Bool;
}

contract DeepNest {
    d: S1;

    init() {
        self.d = S1{f1: S2{x: 5, y: true}, f2: false};
    }
}