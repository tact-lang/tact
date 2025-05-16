struct A { i: Int }
struct B { a: A }
struct C { b: B }

contract NestedMany {
    c: C;

    init() {
        self.c = C{ b: B{ a: A{ i: 42 } } };
    }
}
