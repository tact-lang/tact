struct C {
    s: String?;
    v: Int;
}

struct B {
    cfield: C;
    flag: Bool;
}

struct A {
    bfield: B;
    num: Int?;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            bfield: B{
                cfield: C{
                    s: null,
                    v: 123,
                },
                flag: true,
            },
            num: null,
        };
    }
}
