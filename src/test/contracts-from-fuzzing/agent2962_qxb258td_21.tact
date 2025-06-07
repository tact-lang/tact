struct X {
    a: Int?;
    b: Bool;
}

struct Y {
    c: String?;
    d: Bool;
}

struct XY {
    x: X;
    y: Y;
}

contract CrossNestedOptionals {
    val: XY;

    init() {
        self.val = XY{
            x: X{ a: null, b: true },
            y: Y{ c: null, d: false }
        };
    }
}