struct NestedOpt {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    maybe: NestedOpt?;

    init() {
        self.maybe = null;
    }
}