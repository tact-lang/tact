struct Inner1 {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
    d: String = "x";
}

struct Inner2 {
    e: Int = 5;
    f: Bool = false;
    g: String?;
}

struct Combo {
    inner1: Inner1;
    inner2: Inner2;
    xx: Int?;
    yy: Int = 99;
}

contract Test {
    data: Combo;

    init() {
        self.data = Combo{
            inner1: Inner1{ c: null },
            inner2: Inner2{ g: null },
            xx: null,
            yy: 101
        };
    }
}