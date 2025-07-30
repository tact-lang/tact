struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalFields {
    opt: InnerOpt;

    init() {
        self.opt = InnerOpt {
            a: null,
            b: null,
        };
    }
}
