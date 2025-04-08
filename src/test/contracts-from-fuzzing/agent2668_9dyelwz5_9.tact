struct A { a1: Int; a2: Bool; }
struct B { b1: Int; b2: A; }
struct C { c1: B; c2: String; }
struct D { d1: C; d2: Cell; }
struct E { d: D; s: Slice; }

contract LongChainTest {
    data: E;

    init() {
        self.data = E{
            d: D{ d1: C{ c1: B{ b1:1, b2:A{a1:2,a2:false}}, c2:"q" }, d2:emptyCell() },
            s: emptyCell().asSlice()
        };
    }
}
