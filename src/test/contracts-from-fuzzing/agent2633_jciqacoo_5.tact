struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
}

struct C {
    c: Int;
    b: B;
}

contract DeepOpt {
    val: C?;
    init() {
        self.val = null;
    }
}