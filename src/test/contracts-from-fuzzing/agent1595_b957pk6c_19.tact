struct NestedOption {
    innerOpt: Int?;
    strOpt: String?;
}

contract TestContract {
    opt: NestedOption;

    init() {
        self.opt = NestedOption{innerOpt:null, strOpt:null};
    }
}