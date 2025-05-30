struct Embedded {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    optionalEmbedded: Embedded?;

    init() {
        self.optionalEmbedded = null;
    }
}
