struct RecA { b: RecB; }
struct RecB { c: Int; }

contract RecursionTest {
    a: RecA;
    init() {
        self.a = RecA{ b: RecB{ c: 5 } };
    }
}