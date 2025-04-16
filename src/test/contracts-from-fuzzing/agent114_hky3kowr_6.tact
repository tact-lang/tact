struct NullableFields {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract MultipleOptionalContract {
    data: NullableFields;

    init() {
        self.data = NullableFields{
            intOpt: null,
            boolOpt: null,
            strOpt: null,
        };
    }
}