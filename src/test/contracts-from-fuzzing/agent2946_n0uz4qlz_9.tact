struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Middle {
    one: InnerA;
    two: InnerB;
}

struct Outer {
    mid: Middle;
}

contract ComplexNested {
    store: Outer;

    init() {
        self.store = Outer{
            mid: Middle{
                one: InnerA{ a: 1 },
                two: InnerB{ b: true }
            }
        };
    }
}