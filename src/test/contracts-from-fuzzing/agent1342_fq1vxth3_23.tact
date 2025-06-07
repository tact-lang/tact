struct InnerOpt {
    foo: Int?;
}

contract OneOpt {
    s: InnerOpt;

    init() {
        self.s = InnerOpt{
            foo: 42
        };
    }
}