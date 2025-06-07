message(101) M {
    v: Int;
}

struct Combo {
    a: Int;
    b: M?;
    c: String?;
}

contract MixedPartial {
    saved: Combo;

    init() {
        self.saved = Combo{
            a: 7,
            b: null,
            c: "X"
        };
    }
}