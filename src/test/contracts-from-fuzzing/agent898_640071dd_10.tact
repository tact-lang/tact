struct InnerOption {
    foo: String?;
}

contract OptionFieldContract {
    opt: InnerOption?;

    init() {
        self.opt = null;
    }
}
