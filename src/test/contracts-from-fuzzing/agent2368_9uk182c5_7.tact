struct Inner1 { x: Int; }
struct Inner2 { y: Int; }
struct Inner3 { z: Int; }

struct Parent {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract ManyNested {
    storage: Parent;

    init() {
        self.storage = Parent{
            a: Inner1{ x: 1 },
            b: Inner2{ y: 2 },
            c: Inner3{ z: 3 }
        };
    }
}