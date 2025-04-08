struct SubOpt {
    x: Int?;
}

contract ImplicitNullNested {
    optField: SubOpt?;

    init() {
        self.optField = null;
    }
}