struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract TestContract {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{x:1};
        self.b = B{y:self.a};
        self.c = C{z:self.b};
    }
}