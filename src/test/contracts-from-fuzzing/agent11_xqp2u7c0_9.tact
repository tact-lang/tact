struct OptionalSerializeHints {
    a: Int? as uint16;
    b: Bool?;
    c: String?;
}

contract OptionalSerHint {
    s: OptionalSerializeHints;

    init() {
        self.s = OptionalSerializeHints{
            a: null,
            b: true,
            c: "hello"
        };
    }
}