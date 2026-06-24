struct InnerOpt {
    str: String?;
}

contract OptStructNull {
    val: InnerOpt?;

    init() {
        self.val = null;
    }
}