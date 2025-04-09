struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct BigNest {
    x: A;
    y: B;
    z: C;
}

contract MultiStructFieldsTest {
    val: BigNest;

    init() {
        self.val = BigNest{
            x: A{a:1},
            y: B{b:2},
            z: C{c:3}
        };
    }
}