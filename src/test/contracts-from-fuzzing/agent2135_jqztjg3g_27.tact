struct A {
    v: Int;
}

contract OptionalFieldsInit {
    f: A?;

    init() {
        self.f = null;
        self.f = A{v: 5};
    }
}