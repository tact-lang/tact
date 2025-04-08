struct InnerA { a: Int; }
struct InnerB { b: Bool; }
struct Mid {
    ia: InnerA;
    ib: InnerB;
    midVal: Int?;
}

struct Outer {
    prim: Int;
    nested: Mid;
    flag: Bool?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            prim: 11,
            nested: Mid{
                ia: InnerA{ a: 22 },
                ib: InnerB{ b: true },
                midVal: null
            },
            flag: null
        };
    }
}