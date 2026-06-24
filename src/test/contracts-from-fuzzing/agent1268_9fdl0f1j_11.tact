struct StringCombo {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    s5: String;
}

contract StringFieldsContract {
    fields: StringCombo;

    init() {
        self.fields = StringCombo{
            s1: "a",
            s2: null,
            s3: "c",
            s4: null,
            s5: "e",
        };
    }
}