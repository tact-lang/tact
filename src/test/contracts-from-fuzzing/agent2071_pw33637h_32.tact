struct InnerTest {
    x: Int;
}

contract ManyOptionInner {
    a: InnerTest?;
    b: InnerTest?;
    c: InnerTest?;
    d: InnerTest?;

    init() {
        self.a = InnerTest{ x: 1 };
        self.b = null;
        self.c = InnerTest{ x: 3 };
        self.d = null;
    }
}