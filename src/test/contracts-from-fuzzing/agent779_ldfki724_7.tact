struct Mid1 {
    a: Int;
    b: Int?;
}

struct Mid2 {
    c: Bool;
    d: Bool?;
}

struct Top {
    left: Mid1;
    right: Mid2;
    e: Int;
}

contract CrossNest {
    hold: Top;

    init() {
        self.hold = Top{
            left: Mid1{ a: 10, b: null },
            right: Mid2{ c: true, d: false },
            e: 256
        };
    }
}