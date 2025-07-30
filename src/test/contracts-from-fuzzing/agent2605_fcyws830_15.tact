struct Container {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract ComplexOptionalField {
    data: Container?;

    init() {
        self.data = null;
    }
}
