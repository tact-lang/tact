struct JustOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract PureOptStructs {
    val: JustOpt;

    init() {
        self.val = JustOpt{ a: null, b: true, c: null };
    }
}