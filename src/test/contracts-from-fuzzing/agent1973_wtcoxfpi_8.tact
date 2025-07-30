struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract NestedOptionalField {
    f: NestedOpt?;

    init() {
        self.f = null;
    }
}
