struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    val: Int;
}

contract OptDeep {
    root: A;

    init() {
        self.root = A{
            b: B{ c: null }
        };
    }
}