struct StringDefaults {
    text: String = "default text";
}

contract StringDefaultInStruct {
    field: StringDefaults;

    init() {
        self.field = StringDefaults{};
    }
}