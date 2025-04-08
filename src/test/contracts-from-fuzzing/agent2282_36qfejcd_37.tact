struct A { a: Int }
struct B { b: A }
struct C { c: B }

contract Test33 {
    s: C;
    init() {
        self.s = C{ c: B{ b: A{ a:42 } } };
    }
}