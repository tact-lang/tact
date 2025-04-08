struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract NestedReordered {
    d: Int;
    c: C;
    b: Bool;

    init() {
        self.d = 7;
        self.c = C{z: B{y:A{x:15}}};
        self.b = false;
    }
}