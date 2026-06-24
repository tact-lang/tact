struct D { v: Int; }
struct C { d: D; }
struct B { c: C; }
struct A { b: B; }

contract DeepNestedChain {
    receive() {
        let d = D { v: 999 };
        let c = C { d: d };
        let b = B { c: c };
        let a = A { b: b };
        a.b.c.d.v;
    }
}
