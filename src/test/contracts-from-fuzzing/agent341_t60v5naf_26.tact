struct WithString {
    str: String;
}

contract StringField {
    field: WithString;

    init() {
        self.field = WithString{ str: "abc" };
    }
}