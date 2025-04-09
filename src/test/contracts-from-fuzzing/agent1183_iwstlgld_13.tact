struct InnerA {
    foo: Int;
}

struct InnerB {
    bar: Int;
}

struct Outer {
    a: InnerA;
    b: InnerB;
}

contract NestedMultiStruct {
    s: Outer;

    init() {
        self.s = Outer{
            a: InnerA{ foo: 1 },
            b: InnerB{ bar: 2 },
        };
    }
}