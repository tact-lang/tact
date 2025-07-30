struct S {
    x: Int;
}

contract OptionalStructWithDefaults {
    a: S? = null;
    b: Int = 5;

    init() {
        self.a = null;
        self.b = 10;
    }
}