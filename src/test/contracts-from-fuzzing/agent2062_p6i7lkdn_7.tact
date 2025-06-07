struct InnerOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalFields {
    opt: InnerOpt;
    init() {
        self.opt = InnerOpt{
            a: null,
            b: null,
            c: null,
        };
    }
}