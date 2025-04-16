struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract CompOpt {
    innerOpt: InnerOpt?;

    init() {
        self.innerOpt = InnerOpt{
            foo: null,
            bar: null,
        };
    }
}