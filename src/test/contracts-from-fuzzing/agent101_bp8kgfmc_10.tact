struct S {
    x: Int;
}

contract OptNested {
    data: S? = null;

    init() {
        self.data = S{ x: 123 };
    }
}