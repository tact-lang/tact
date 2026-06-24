struct A {
    q: Int;
}

struct B {
    w: Int;
}

struct C {
    e: A;
    r: B;
}

struct D {
    t: C;
    y: C?;
}

contract ManyEmbedded {
    m: D;

    init() {
        self.m = D{
            t: C{ e: A{q: 9}, r: B{w:8} },
            y: null
        };
    }
}