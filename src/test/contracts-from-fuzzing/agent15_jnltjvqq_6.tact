struct A { a: Int; }
struct B { a: A; }
struct C { a: B; }
struct D { a: C; }
struct E { a: D; }

contract TestDeepNested {
    receive() {
        let s: E = E { a: D { a: C { a: B { a: A { a: 42 } } } } };
        dump(s.a.a.a.a.a);
    }
}
