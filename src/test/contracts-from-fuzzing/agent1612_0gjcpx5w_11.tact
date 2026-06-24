struct A {
    i: Int;
}

struct B {
    a: A;
    opt: Int?;
}

struct C {
    b: B;
    txt: String;
}

struct D {
    c: C;
    flag: Bool;
}

contract NestedOptionals {
    val: D;

    init() {
        self.val = D{
            c: C{
                b: B{
                    a: A{ i: 7 },
                    opt: null,
                },
                txt: "deep",
            },
            flag: false,
        };
    }
}
