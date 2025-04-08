struct A {
    foo: Int?;
}

struct B {
    bar: A?;
}

struct C {
    baz: B?;
}

contract TestContract {
    nestedOpt: C;

    init() {
        self.nestedOpt = C{baz: null};
    }
}