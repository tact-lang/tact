struct A {
    next: B?;
    v1: Int;
}

struct B {
    next: C?;
    v2: Int;
}

struct C {
    leaf: Int;
}

contract Test {
    root: A;

    init() {
        self.root = A{next:null, v1:5};
    }
}