struct D {
    val: Int = 42;
    flag: Bool? = null;
}

struct C {
    d: D = D{};
    label: String? = null;
}

struct B {
    c: C = C{};
}

struct A {
    b: B = B{};
}

contract TestContract {
    root: A;

    init() {
        self.root = A{};
    }
}