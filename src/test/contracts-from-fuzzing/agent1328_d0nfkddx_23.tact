struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepOpt {
    val: C?;
    init() {
        self.val = null;
    }
}