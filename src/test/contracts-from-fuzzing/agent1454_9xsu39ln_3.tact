struct InnerOpt {
    val1: Int?;
    val2: Bool?;
}

contract TestOpt {
    nestedOpt: InnerOpt;

    init() {
        self.nestedOpt = InnerOpt{ val1: null, val2: true };
    }
}