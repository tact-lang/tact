struct A { x: Int = 1; }
struct B { y: Int = 2; }
struct C { z: Int = 3; }

contract NestedMany {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{};
        self.b = B{};
        self.c = C{};
    }
}