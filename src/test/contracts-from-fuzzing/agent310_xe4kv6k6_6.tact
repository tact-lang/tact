struct A {
    value: Int;
}

struct B {
    a: A;
    opt: Int?;
}

struct C {
    b: B;
    flag: Bool;
}

contract DeepMixedNest {
    s: C;

    init() {
        self.s = C{
            b: B{
                a: A{value: 13},
                opt: null
            },
            flag: true
        };
    }
}