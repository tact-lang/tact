struct InnerOpt {
    nested: Int?;
}

contract OptionalInStructOptionals {
    test: InnerOpt?;

    init() {
        self.test = null;
    }
}