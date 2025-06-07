struct A { f: Int; }
struct B { a: A; }
struct C { b: B; }

contract AltNest {
    x: C;

    init() {
        self.x = C{ b: B{ a: A{ f: 9 } } };
    }
}