struct InlineOpt {
    a: Int?;
    b: Bool?;
}

contract TestOpt {
    val: InlineOpt?;
    init() {
        self.val = null;
    }
}