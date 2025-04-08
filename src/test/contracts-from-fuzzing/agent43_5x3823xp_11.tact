struct A {
    a: Int = 1;
    b: Int = 2;
}

struct B {
    a: A;
    c: Int = 3;
}

contract DefaultedNested {
    s: B;

    init() {
        self.s = B{
            a: A{},
            c: 33
        };
    }
}
