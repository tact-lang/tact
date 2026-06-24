struct InnerA {
    a: Int;
}

struct InnerB {
    b: Int;
}

struct Outer {
    ia: InnerA;
    ib: InnerB;
}

contract MultiNested {
    d: Outer;

    init() {
        self.d = Outer{ia: InnerA{a:1}, ib: InnerB{b:2}};
    }
}
