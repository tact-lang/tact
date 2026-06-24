struct InlineNestedDefaults {
    number: Int = 5;
    flag: Bool = true;
    text: String = "msg";
}

contract NestedDefaultStructPersistent {
    data: InlineNestedDefaults;

    init() {
        self.data = InlineNestedDefaults{};
    }
}