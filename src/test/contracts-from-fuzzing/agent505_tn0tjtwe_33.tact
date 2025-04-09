struct Inner {
    x: Int;
}

struct Middle {
    a: Int;
    inn: Inner;
}

struct Outer {
    m: Middle;
}

contract SerialDeepNested {
    s: Outer;

    init() {
        self.s = Outer{m: Middle{a: 7, inn: Inner{x: 42}}};
    }
}
