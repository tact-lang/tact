struct InnerSt {
    a: Int;
    b: Bool;
}

contract OptTop {
    innerOpt: InnerSt?;

    init() {
        self.innerOpt = InnerSt{
            a: 6,
            b: false,
        };
    }
}
