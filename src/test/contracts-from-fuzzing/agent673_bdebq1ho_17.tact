struct S2 {
    x: Int;
}

struct S1 {
    z: S2;
    x: Int;
    y: Int;
}

contract OrderCheck {
    data: S1;

    init() {
        self.data = S1{ z: S2{ x:1 }, x:2, y:3 };
    }
}