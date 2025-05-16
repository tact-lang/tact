struct StringDefault {
    s: String = "hello";
    s2: String = "world";
}

contract StringDefField {
    val: StringDefault;

    init() {
        self.val = StringDefault{};
    }
}