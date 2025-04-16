struct A {
    foo: Int;
}

contract OptionalWithDefault {
    data: A? = null;

    init() {
        self.data = A{ foo: 42 };
    }
}
