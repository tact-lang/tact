struct A {
    val: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

struct D {
    c: C?;
}

contract TestContract {
    nested: D?;
    init() {
        self.nested = null;
    }
}