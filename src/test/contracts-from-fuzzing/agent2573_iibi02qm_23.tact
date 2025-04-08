struct NestedOpts {
    addressField: Address?;
    sliceField: Slice?;
    intField: Int?;
    textField: String?;
}

contract OptOfOptStruct {
    nested: NestedOpts?;

    init() {
        self.nested = null;
    }
}