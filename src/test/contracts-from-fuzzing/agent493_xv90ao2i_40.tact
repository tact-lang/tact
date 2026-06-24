struct Holder {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ChainInlineDefaults {
    val: Holder;

    init() {
        self.val = Holder{
            a:null,
            b:null,
            c:null
        };
    }
}