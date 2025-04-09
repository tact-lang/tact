struct A {
    flag: Bool;
}

struct B {
    inner: A;
    optVal: Int?;
}

contract NestedOptionals {
    field: B;

    init() {
        self.field = B {
            inner: A{ flag: true },
            optVal: null
        };
    }
}