struct InnerOptional {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    maybeInner: InnerOptional?;

    init() {
        self.maybeInner = null;
    }
}