struct OptWrap {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test22 {
    ow: OptWrap;

    init() {
        self.ow = OptWrap{
            a: null,
            b: null,
            c: null,
        };
    }
}
