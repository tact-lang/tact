struct A { a: Int }
struct B { b: A }
struct C { c: B }
struct D { d: C }

contract Test15 {
    deeply: D;

    init() {
        self.deeply = D{ d: C{ c: B{ b: A{ a: 7 } } } };
    }
}
