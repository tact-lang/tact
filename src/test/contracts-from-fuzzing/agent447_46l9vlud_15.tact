struct InnerA { a: Int; }
struct InnerB { b: Int; }

struct Outer {
    inner1: InnerA;
    inner2: InnerB;
}

contract NestedStructs {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner1: InnerA{a:1},
            inner2: InnerB{b:2}
        };
    }
}