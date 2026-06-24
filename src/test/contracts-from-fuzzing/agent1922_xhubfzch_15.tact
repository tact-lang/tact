struct A {
    b: B;
    flag: Bool;
}

struct B {
    c: C;
    opt: Int?;
}

struct C {
    num: Int;
}

contract MultiNest {
    top: A;

    init() {
        self.top = A{
            b: B{
                c: C{num: 55},
                opt: null
            },
            flag: true
        };
    }
}