struct Str {
    s: String;
}

contract StringField {
    field: Str;
    init() {
        self.field = Str{s: "test"};
    }
}