struct A { x: Int }
struct B { y: Int }
struct C {
    a: A;
    b: B;
}

contract MultiNest {
    complex: C;

    init() {
        self.complex = C { a: A { x: 10 }, b: B { y: 20 } };
    }

    receive() {
        let _ = self.complex.a.x + self.complex.b.y;
    }
}