struct A { x: Int; }
struct B { x: Int; }
struct C { a: A; b: B; ci: Int; }

contract ManyStructs {
    s: C;
    init() {
        self.s = C { a: A{ x:1 }, b: B{ x:2 }, ci: 3 };
    }
}