struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }
struct D { q: C; }

contract TestContract {
    nested: D;

    init() {
        self.nested = D{q: C{z: B{y: A{x: 123}}}};
    }
}