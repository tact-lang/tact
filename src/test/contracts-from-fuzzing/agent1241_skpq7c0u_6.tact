struct A {
    b: B;
    num: Int;
}

struct B {
    str: String;
    c: C;
}

struct C {
    flag: Bool;
}

contract NestedComplex {
    data: A;

    init() {
        self.data = A{
            b: B{
                str: "x",
                c: C{
                    flag: true,
                },
            },
            num: 123,
        };
    }
}
