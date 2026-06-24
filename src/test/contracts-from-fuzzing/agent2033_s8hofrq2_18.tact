struct OptionalSerialize {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
}

contract Test {
    s: OptionalSerialize;

    init() {
        self.s = OptionalSerialize{
            a: null,
            b: null,
            c: "hi"
        };
    }
}