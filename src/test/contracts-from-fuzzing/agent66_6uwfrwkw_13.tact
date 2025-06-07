struct A {
    x: Int?;
}

struct B {
    a: A;
    y: Int?;
}

contract OptMix {
    k: B;

    init() {
        self.k = B{
            a: A{ x: null },
            y: 1
        };
    }
}