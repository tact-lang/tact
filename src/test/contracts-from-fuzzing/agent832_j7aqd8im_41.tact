struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepNest {
    c: C = C{b:B{a:A{x:42}}};
    receive() {
        let _ = self.c.b.a.x;
    }
}