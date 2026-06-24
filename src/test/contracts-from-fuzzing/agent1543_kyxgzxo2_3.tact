struct B {
    y: Int = 7;
}

struct A {
    x: Int = 42;
    b: B = B{};
}

contract TestContract {
    data: A;
    init() {
        self.data = A{};
    }
}