struct OptOpted {
    f1: Int?;
    f2: Bool?;
}

contract HasInnerOpt {
    opt: OptOpted?;
    init() {
        self.opt = null;
    }
}