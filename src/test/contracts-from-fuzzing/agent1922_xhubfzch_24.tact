struct StringField {
    s: String;
}

contract PersistentWithString {
    field: StringField;

    init() {
        self.field = StringField{
            s: "SomeString"
        };
    }
}