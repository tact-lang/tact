struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct D {
    a: A?;
    b: B?;
    c: C?;
}

contract MultiNullable {
    data: D;

    init() {
        self.data = D{
            a: null,
            b: null,
            c: null
        };
    }
}