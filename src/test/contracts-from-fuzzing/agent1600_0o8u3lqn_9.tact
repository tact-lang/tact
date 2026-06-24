struct AllOptionals {
    a: Bool?;
    b: String?;
    c: Int?;
    d: Address?;
}

contract AllOptionalFieldsContract {
    fields: AllOptionals;

    init() {
        self.fields = AllOptionals{a: null, b: null, c: null, d: null};
    }
}