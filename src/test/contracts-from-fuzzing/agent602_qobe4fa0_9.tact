struct A {
    s: String;
    b: Bool;
}

struct B {
    a: A;
    s_opt: String?;
}

struct C {
    b_opt: B?;
    b: B;
}

contract TestContract {
    cfield: C;

    init() {
        self.cfield = C{
            b_opt: null,
            b: B{
                a: A{ s: "hi", b: false },
                s_opt: null,
            },
        };
    }
}