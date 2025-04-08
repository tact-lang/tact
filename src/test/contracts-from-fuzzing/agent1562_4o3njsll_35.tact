struct A {
    x: Int = 1;
}

contract ABC {
    a: A;

    init() {
        self.a = A{};
    }
}
