struct A { x: Int; }
struct B { a: A?; }
struct C { b: B; }
struct D { c: C?; }
struct E { d: D; }

contract TestContract {
    e: E;

    init() {
        self.e = E{ d: D{ c: null } };
    }
}
