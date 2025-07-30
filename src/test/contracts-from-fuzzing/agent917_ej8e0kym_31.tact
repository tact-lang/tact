struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }

struct ComplexChain {
    first: A;
    second: B;
    third: C;
    fourth: D;
}

contract ChainTest {
    val: ComplexChain;

    init() {
        self.val = ComplexChain{
            first: A{a:1},
            second: B{b:2},
            third: C{c:3},
            fourth: D{d:4}
        };
    }
}