struct HasStrDefaults {
    name: String = "default";
    comment: String? = null;
}

contract DefaultStrings {
    data: HasStrDefaults;
    init() {
        self.data = HasStrDefaults {};
    }
}