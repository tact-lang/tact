struct SingleField {
    bigString: String;
}

contract LargeStringField {
    data: SingleField;

    init() {
        self.data = SingleField{ bigString: "This is a test string" };
    }
}