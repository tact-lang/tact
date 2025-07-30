struct InnerOpt {
    foo: Int?;
}

contract OptStructOptional {
    nested: InnerOpt?;

    init() {
        self.nested = null;
    }
}