struct InnerOpt {
    val: Int?;
}

contract OptWrapper {
    wrapper: InnerOpt?;

    init() {
        self.wrapper = null;
    }
}
