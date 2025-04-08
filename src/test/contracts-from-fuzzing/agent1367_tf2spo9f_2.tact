struct A {
    a1: Int;
    a2: Int?;
}

struct B {
    b1: A;
    b2: Int;
    b3: A?;
}

contract Test {
    s: B;
    
    init() {
        self.s = B{
            b1: A{ a1: 1, a2: null },
            b2: 2,
            b3: null
        };
    }
}