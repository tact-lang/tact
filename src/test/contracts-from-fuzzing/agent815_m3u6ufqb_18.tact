struct A {
    val: Int;
}

struct B {
    aval: A;
}

struct C {
    bval: B;
}

contract NullInDeepStruct {
    state: C?;

    init() {
        self.state = null;
    }
}