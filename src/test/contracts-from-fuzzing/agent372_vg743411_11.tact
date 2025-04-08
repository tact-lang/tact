struct InnerOptOpt {
    inner: Int?;
}

contract Test {
    opt: InnerOptOpt?;
    init() {
        self.opt = null;
    }
}