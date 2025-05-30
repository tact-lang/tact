struct InnerOpt {
    val: Int?;
}

contract HasInnerOpt {
    s: InnerOpt;

    init() {
        self.s = InnerOpt{};
    }
}