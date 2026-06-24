struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract NestedOptFields {
    optField: InnerOpt?;

    init() {
        self.optField = null;
    }
}