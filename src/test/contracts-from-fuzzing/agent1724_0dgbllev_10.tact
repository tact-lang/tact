struct Tiny {
    a: Int as uint4;
    b: Bool;
}

struct Bigger {
    t: Tiny;
    c: Int as uint8;
}

contract SerTest {
    big: Bigger;
    init() {
        self.big = Bigger{
            t: Tiny{ a: 7, b: true },
            c: 15
        };
    }
}