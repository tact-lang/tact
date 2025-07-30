struct A {
    x: Int;
}

struct B {
    a: A;
}

contract InitChain {
    s: B;

    init() {
        self.s = B{
            a: A{ x: 1 }
        };
    }
}