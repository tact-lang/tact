struct A {
    val: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract OptionalDeepNested {
    maybeC: C?;
    init() {
        self.maybeC = null;
    }
}