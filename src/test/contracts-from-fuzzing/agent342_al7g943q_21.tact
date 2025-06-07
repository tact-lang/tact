struct InnerOptionalFields {
    value: Int?;
    text: String?;
}

contract OptionalsInsideStruct {
    fld: InnerOptionalFields;

    init() {
        self.fld = InnerOptionalFields{
            value: null,
            text: null
        };
    }
}
