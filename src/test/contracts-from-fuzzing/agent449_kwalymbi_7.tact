struct A {
    a1: Int;
    a2: String;
}

struct B {
    b1: Int;
    a_struct: A;
}

struct C {
    flag: Bool;
    b_struct: B;
    opt_str: String?;
}

contract TestContract {
    cfield: C;

    init() {
        self.cfield = C{
            flag: true,
            b_struct: B{
                b1: 13,
                a_struct: A{
                    a1: 5,
                    a2: "hi",
                },
            },
            opt_str: null,
        };
    }
}
