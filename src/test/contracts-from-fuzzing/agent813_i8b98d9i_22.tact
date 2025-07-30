struct WithString {
    s: String;
}

contract StringStructField {
    field: WithString;

    init() {
        self.field = WithString{
            s: "test string"
        };
    }
}