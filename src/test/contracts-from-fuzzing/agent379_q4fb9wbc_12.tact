struct S {
    x: Int;
}

contract OptionalStructFieldDirect {
    field: S?;

    init() {
        self.field = S{x: 3};
    }
}