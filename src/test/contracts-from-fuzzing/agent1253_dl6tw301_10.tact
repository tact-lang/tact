struct Child {
    val: Int;
}

struct Parent {
    a: Child?;
    b: Child?;
    c: Child?;
}

contract MultiOptNested {
    p: Parent;

    init() {
        self.p = Parent{
            a: Child{ val: 1 },
            b: null,
            c: Child{ val: 3 }
        };
    }

    receive() {}
}