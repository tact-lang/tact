struct A {
    f: Int?;
}

struct B {
    aa: A;
    bb: A;
}

contract TwoNestedOpt {
    fld: B;

    init() {
        self.fld = B{
            aa: A{ f: null },
            bb: A{ f: 42 }
        };
    }
}