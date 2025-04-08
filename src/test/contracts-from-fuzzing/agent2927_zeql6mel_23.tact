struct PassThru {
    a: Int;
}

contract OptionalStructField {
    s: PassThru?;

    init() {
        self.s = PassThru{ a: 10 };
    }
}