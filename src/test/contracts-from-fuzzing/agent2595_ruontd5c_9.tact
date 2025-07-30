struct NestedOptionalStruct {
    innerInt: Int?;
    innerBool: Bool?;
    innerString: String?;
}

contract OptionalStructStorage {
    nested: NestedOptionalStruct?;

    init() {
        self.nested = null;
    }
}