struct A { x: Int }
struct B { a: A }
struct C { b: B }

contract UpdateDeep {
    d: C;

    init() {
        self.d = C{ b: B{ a: A{ x:1 } } };
    }

    receive() {
        self.d.b.a.x = 777;
    }
}
