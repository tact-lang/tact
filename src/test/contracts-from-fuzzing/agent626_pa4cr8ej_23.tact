struct OptsWrap {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MultiOptFields {
    val: OptsWrap?;

    init() {
        self.val = OptsWrap{ a: 1, b: true, c: null };
    }
}