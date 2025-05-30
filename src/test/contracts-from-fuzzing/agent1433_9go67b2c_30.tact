struct A {
    val: Int;
    str: String;
}

struct B {
    s: A;
    optInt: Int?;
}

struct C {
    t: B;
    optStr: String?;
}

contract StrongNestOpt {
    v: C;

    init() {
        self.v = C{
            t: B{
                s: A{val:1,str:"x"},
                optInt: null
            },
            optStr: null
        };
    }
}
