struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test4 {
    innerOpt: InnerOpt;

    init() {
        self.innerOpt = InnerOpt{
            a: null,
            b: true,
            c: null
        };
    }
}