struct OptNested {
    s1: String?;
    s2: String?;
    b1: Bool?;
    b2: Bool?;
}

contract OptionalFields {
    opt: OptNested;

    init() {
        self.opt = OptNested{
            s1: null,
            s2: "hi",
            b1: true,
            b2: null,
        };
    }
}