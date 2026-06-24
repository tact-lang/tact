struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Middle {
    i1: Inner1;
    i2: Inner2;
}

struct Outer {
    mid: Middle;
    extra: Int;
}

contract NestedMultiStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                i1: Inner1{a: 1},
                i2: Inner2{b: 2},
            },
            extra: 3,
        };
    }
}
