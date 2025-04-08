struct InnerS {
    p: Int;
}

contract OptionalTop {
    maybe: InnerS?;

    init() {
        self.maybe = InnerS{p: 55};
    }
}