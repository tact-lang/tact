struct Inner {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
}

contract Test {
    nestedOpt: Inner;

    init() {
        self.nestedOpt = Inner{
            optInt: null,
            optBool: null,
            optAddr: null,
        };
    }
}
