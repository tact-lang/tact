struct A {
    a: Int;
}

struct B {
    b: Int;
    next: A;
}

contract WithCycle {
    f: B;

    init() {
        self.f = B{b:1,next:A{a:2}};
    }
}