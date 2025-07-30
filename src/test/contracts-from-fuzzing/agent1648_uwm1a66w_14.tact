struct InnerOpt {
    val: Int?;
}

contract OuterOpt {
    nested: InnerOpt?;

    init() {
        self.nested = null;
    }
}