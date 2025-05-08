struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }
struct Nested {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    field: Nested;

    init() {
        self.field = Nested{
            a: A{ x: 1 },
            b: B{ y: 2 },
            c: C{ z: 3 }
        };
    }
}