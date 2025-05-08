struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct C {
    a: A;
    b: B;
}

contract TestContract {
    composite: C = C{a: A{x:1}, b: B{y:2}};

    init() {
        self.composite = C{a: A{x:10}, b: B{y:20}};
    }
}