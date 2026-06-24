struct InnerOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptFields {
    val: InnerOpt;

    init() {
        self.val = InnerOpt{
            a: null,
            b: null,
            c: true
        };
    }
}