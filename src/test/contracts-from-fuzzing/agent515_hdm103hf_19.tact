struct S {
    x: Int?;
}

contract DefaultOptionalField {
    s: S;

    init() {
        self.s = S{x: null};
    }
}
