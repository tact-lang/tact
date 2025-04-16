struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    b: B;
}

contract NestedFlat {
    c: C = C{
        b: B{
            y:2,a:A{x:1}
        }
    };
    receive() {
        let _ = self.c.b.a.x;
    }
}