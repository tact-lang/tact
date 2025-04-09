// deeply nested multi-level optional / non-optional
struct A { b: B?; }
struct B { c: C; }
struct C { d: D?; }
struct D { e: Int; }

contract DeepOptionalTest {
    f: A;

    init() {
        self.f = A{ b: null };
    }
}
