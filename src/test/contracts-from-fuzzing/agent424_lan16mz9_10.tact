struct NestedOptionalStruct {
    a: Int?;
    b: String?;
}

contract TopLevelOptional {
    data: NestedOptionalStruct?;

    init() {
        self.data = NestedOptionalStruct{
            a: 42,
            b: null
        };
    }
}