struct IntOpt {
    v: Int?;
}

contract ReplaceOpt {
    opt: IntOpt?;

    init() {
        self.opt = null;
        self.opt = IntOpt{v:42};
    }
}