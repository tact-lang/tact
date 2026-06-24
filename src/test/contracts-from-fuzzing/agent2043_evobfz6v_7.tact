struct A {
    x: Int;
    y: Int;
}

struct B {
    a1: A;
    a2: A;
    optA: A?;
}

contract NestedOptional {
    f: B?;

    init() {
        self.f = null;
    }
}
