struct A { x: Int; }

struct B { a: A; }

struct C { b: B; }

struct D { c: C; }

contract TestContract {
    root: D;

    init() {
        self.root = D{ c:C{ b:B{ a:A{ x:123 } } } };
    }
}