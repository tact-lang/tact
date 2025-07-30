struct A {
    val: Int?;
}

struct B {
    a: A;
    str: String?;
}

contract NestedOpts {
    dat: B;

    init() {
        self.dat = B{
            a: A{ val: null },
            str: null
        };
    }
}