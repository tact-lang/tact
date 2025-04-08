struct InnerS {
    f: Int;
}

contract OptStructTop {
    opt: InnerS?;

    init() {
        self.opt = InnerS{f: 7};
    }
}