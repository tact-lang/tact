struct EmbedStruct {
    foo: Int;
}

contract OptionalStructField {
    maybe: EmbedStruct?;

    init() {
        self.maybe = null;
    }
}