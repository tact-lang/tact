struct A { b: B }
struct B { c: C }
struct C { d: D }
struct D { e: Int }

contract ABCD {
    abcd: A;

    init() {
        self.abcd = A { b: B { c: C { d: D { e: 77 } } } };
    }
}