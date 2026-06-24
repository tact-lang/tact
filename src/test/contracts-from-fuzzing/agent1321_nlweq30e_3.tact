struct A {
    val: Int;
}

struct B {
    aval: A;
}

struct C {
    bval: B;
}

contract DeepNested {
    cval: C;

    init() {
        self.cval = C{ bval: B{ aval: A{ val: 99 } } };
    }
}
