struct A {
    f: Int? = 42;
}

contract OptionalWithDefault {
    x: A;

    init() {
        self.x = A{};
    }
}
