struct D {
    val: Int = 7;
}

struct C {
    d: D = D{};
}

struct B {
    c: C = C{};
}

struct A {
    b: B = B{};
}

contract DeepDefaulted {
    data: A;

    init() {
        self.data = A{};
    }
}