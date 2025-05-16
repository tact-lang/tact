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

contract SiblingNestedTest {
    val: Outer;

    init() {
        self.val = Outer{
            ia: InnerA{ a: 1 },
            ib: InnerB{ b: 2 },
        };
    }
}