struct InnerA {
    x: Int;
}

struct InnerB {
    y: Int;
}

struct Outer {
    a: InnerA;
    b: InnerB;
}

contract SiblingNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            a: InnerA{ x: 10 },
            b: InnerB{ y: 20 }
        };
    }
}