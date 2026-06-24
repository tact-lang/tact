struct Inner1 {
    a: Int;
    b: Int;
}

struct Inner2 {
    c: Int;
    d: Int;
}

struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct Outer {
    m: Middle;
    x: Int;
}

contract MultiNested {
    state: Outer;

    init() {
        self.state = Outer {
            m: Middle { i1: Inner1 { a: 1, b: 2 }, i2: Inner2 { c: 3, d: 4 } },
            x: 5
        };
    }
}