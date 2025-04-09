struct A {
    a1: Int;
    a2: Int;
}

struct B {
    b1: Int;
    b2: Int;
}

struct C {
    a: A;
    b: B;
    optA: A?;
    optB: B?;
}

contract MixDeep {
    data: C;
    init() {
        self.data = C{
            a: A{a1:1, a2:2},
            b: B{b1:3, b2:4},
            optA: A{a1:5, a2:6},
            optB: null
        };
    }
}