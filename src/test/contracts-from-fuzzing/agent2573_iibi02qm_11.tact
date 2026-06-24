struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MetaOptional {
    nestedField: NestedOpt?;

    init() {
        self.nestedField = null;
    }
}