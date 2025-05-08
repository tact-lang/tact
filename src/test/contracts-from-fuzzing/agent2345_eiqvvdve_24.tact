struct OptInner {
    f: Int;
    g: String?;
}

contract WrapperOpt {
    inneropt: OptInner?;

    init() {
        self.inneropt = null;
    }
}