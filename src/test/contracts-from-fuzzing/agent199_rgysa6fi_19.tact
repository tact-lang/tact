struct StringDefaults {
    foo: String = "abc";
    bar: String = "";
}

contract StringFieldDefaults {
    data: StringDefaults;

    init() {
        self.data = StringDefaults{};
    }
}
