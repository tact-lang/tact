struct NestedOptionalStruct {
    optInt: Int?;
    optBool: Bool?;
}

contract NestedOptionalField {
    optStruct: NestedOptionalStruct?;

    init() {
        self.optStruct = NestedOptionalStruct{
            optInt: 99,
            optBool: false
        };
    }
}