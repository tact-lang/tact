struct WithString {
    s: String;
}

contract StringField {
    field: WithString;

    init() {
        self.field = WithString{
            s: "TactLang",
        };
    }
}
