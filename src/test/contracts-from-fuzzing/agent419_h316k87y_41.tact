// Chain of empties defaults
struct A { x: Int = 0 }
struct B { a: A }
struct C { b: B }

contract Chain {
    c: C;

    init() {
        self.c = C{ b: B{ a: A{ x:0 } } };
    }
}