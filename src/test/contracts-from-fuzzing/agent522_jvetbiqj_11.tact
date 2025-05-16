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

contract OrderingTest {
    data: Outer;

    init() {
        self.data = Outer{
            ia: InnerA{a:1},
            ib: InnerB{b:2},
        };
    }
}