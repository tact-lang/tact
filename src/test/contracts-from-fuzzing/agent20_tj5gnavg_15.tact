struct S1 {
    x: Int;
}

struct S2 {
    y: S1?;
}

contract OptionalStructField {
    s: S2;

    init() {
        self.s = S2{ y: S1{ x: 55 } };
    }
}