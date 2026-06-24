struct A {
    x: Int;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract NestedOptionalChain {
    state: C;

    init() {
        self.state = C{
            b: null
        };
    }
}