struct StrIntBoolOpt {
    a: String;
    b: Int?;
    c: Bool?;
}

contract MixedOptional {
    data: StrIntBoolOpt;
    init() {
        self.data = StrIntBoolOpt{
            a: "hi",
            b: null,
            c: null
        };
    }
}
