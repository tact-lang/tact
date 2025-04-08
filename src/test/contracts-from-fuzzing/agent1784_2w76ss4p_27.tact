struct StructWithNestedOpts {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract OptStructHolder {
    nested: StructWithNestedOpts?;

    init() {
        self.nested = null;
    }
}