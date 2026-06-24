struct A {
    x: Int;
}

contract OptOptionalField {
    maybe: A?;

    init() {
        self.maybe = A{ x: 55 };
    }
}