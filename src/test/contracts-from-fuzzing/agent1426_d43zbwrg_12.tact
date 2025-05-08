struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Outer {
    ia: InnerA;
    ib: InnerB;
    c: Int;
    d: Bool;
}

contract ManyNestedStructs {
    store: Outer;

    init() {
        self.store = Outer{
            ia: InnerA{ a: 1 },
            ib: InnerB{ b: true },
            c: 2,
            d: false
        };
    }
}