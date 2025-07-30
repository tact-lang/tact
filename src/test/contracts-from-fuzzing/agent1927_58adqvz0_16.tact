struct Deep {
    s: String;
    c: Cell;
    i: Int;
}

struct Mid {
    d: Deep;
    b: Bool;
}

struct Top {
    m: Mid;
}

contract ComplexNested {
    x: Top;

    init() {
        self.x = Top{ m: Mid{ d: Deep{ s:"s", c:emptyCell(), i:1 }, b:true } };
    }
}