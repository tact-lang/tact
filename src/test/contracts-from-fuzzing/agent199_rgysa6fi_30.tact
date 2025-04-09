struct SelfOptional {
    foo: Int;
    bar: Bool;
}

contract OptionalStructVar {
    s: SelfOptional?;

    init() {
        self.s = null;
    }
}
