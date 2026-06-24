struct MixedOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract MixedOptionalFields {
    a: MixedOpt;

    init() {
        self.a = MixedOpt{
            i: 123,
            b: null,
            s: null,
        };
    }
}
