struct InnerS {
    s: String?;
    b: Bool;
}

contract MultiOption {
    val1: Int?;
    val2: InnerS?;
    init() {
        self.val1 = null;
        self.val2 = null;
    }
}