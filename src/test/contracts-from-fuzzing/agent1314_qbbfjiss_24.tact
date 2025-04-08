struct InnerA { v: Int; }
struct InnerB { x: Bool; }

struct UnionLike {
    a: InnerA?;
    b: InnerB?;
}

contract UnionTest {
    u: UnionLike;

    init() {
        self.u = UnionLike{
            a: null,
            b: InnerB{ x: true },
        };
    }
}