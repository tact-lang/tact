struct A {
    x: Int;
}

struct B {
    y: A;
}

struct C {
    z: B;
}

contract InitNested {
    field: C;
    
    init() {
        let a = A{x: 42};
        let b = B{y: a};
        let c = C{z: b};
        self.field = c;
    }
}