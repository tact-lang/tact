struct InnerOpt {
    foo: Int?;
    bar: String?;
}

contract OptionalStructField {
    nested: InnerOpt?;

    init() {
        self.nested = null;
    }
}
