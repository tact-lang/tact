struct NestedOptionalStruct {
    value: Int?;
    flag: Bool?;
}

contract OptionalStructField {
    container: NestedOptionalStruct?;

    init() {
        self.container = NestedOptionalStruct{ value: 42, flag: true };
    }
}