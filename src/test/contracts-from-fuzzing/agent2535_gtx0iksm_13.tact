struct DeepOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalStruct {
    s: DeepOpt?;

    init() {
        self.s = DeepOpt{
            a: null,
            b: "x",
            c: true
        };
    }
}