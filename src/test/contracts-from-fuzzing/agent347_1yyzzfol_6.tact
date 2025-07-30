struct C {
    value: Int = 5;
}

struct B {
    cOpt: C?;
}

struct A {
    bOpt: B?;
}

contract DeepNested {
    state: A;

    init() {
        self.state = A{ bOpt: B{ cOpt: C{ value: 555 } } };
    }
}