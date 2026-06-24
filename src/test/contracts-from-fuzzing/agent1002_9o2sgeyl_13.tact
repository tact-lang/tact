struct HasDefaults {
    val: Int = 5;
    text: String = "abc";
}

contract DefaultStruct {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}