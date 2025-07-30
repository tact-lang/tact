struct A {
    s: String;
}

struct B {
    inner: A;
    note: String?;
}

struct C {
    wrapper: B;
    flag: Bool?;
}

contract NestedMix {
    param: C;

    init() {
        self.param = C{
            wrapper: B{
                inner: A{s:"hi"},
                note: null,
            },
            flag: null,
        };
    }
}