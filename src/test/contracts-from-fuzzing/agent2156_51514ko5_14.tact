struct A { x: Int }
struct B { y: Int }
struct C { z: Int }

struct Nested {
    a: A;
    b: B;
    c: C;
}

contract ManyNested {
    s: Nested;
    init() {
        self.s = Nested{
            a: A{x:1},
            b: B{y:2},
            c: C{z:3}
        };
    }
}