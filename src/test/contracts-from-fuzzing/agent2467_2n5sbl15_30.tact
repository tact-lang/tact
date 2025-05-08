struct Child { a: Int; }

struct Parent1 { c: Child; }
struct Parent2 { c: Child; d: Int; }

contract EmbedTest {
    p1: Parent1;
    p2: Parent2;
    init() {
        self.p1 = Parent1{ c: Child{ a: 1 } };
        self.p2 = Parent2{ c: Child{ a: 2 }, d: 3 };
    }
}