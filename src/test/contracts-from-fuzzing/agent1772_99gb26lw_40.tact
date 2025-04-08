struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }
struct E { e: D }

contract Test40 {
    e: E;

    init() {
        self.e = E{ e: D{ d: C{ c: B{ b: A{ a: 42 }}}}};
    }
}