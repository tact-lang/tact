struct InnerOpt {
    b: Bool?;
}

contract Test {
    val: InnerOpt?;

    init() {
        self.val = null;
    }
}