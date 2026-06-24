struct InnerA {
    x: Int;
}

struct InnerB {
    y: Bool;
}

struct Parent {
    a: InnerA;
    b: InnerB;
}

contract ParentTest {
    data: Parent;

    init() {
        self.data = Parent{
            a: InnerA{ x: 5 },
            b: InnerB{ y: true }
        };
    }
}
