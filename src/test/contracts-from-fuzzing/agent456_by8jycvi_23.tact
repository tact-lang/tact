struct StringDefaults {
    s: String = "hi";
}

contract StringDefault {
    myString: String = "hello";
    sdef: StringDefaults;

    init() {
        self.myString = "world";
        self.sdef = StringDefaults{};
    }
}