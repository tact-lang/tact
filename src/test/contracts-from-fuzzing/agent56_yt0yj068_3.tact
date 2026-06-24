struct InnerOpt {
    value: Int?;
}

contract Test {
    innerOpt: InnerOpt;

    init() {
        self.innerOpt = InnerOpt{ value: null };
    }
}