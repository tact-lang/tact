struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    z: Int;
}

struct C {
    b: B;
    w: Int;
}

contract NestedABC {
    val: C;

    init() {
        self.val = C{
            b: B{ a: A{x:1,y:2}, z:3 },
            w: 4
        };
    }
}