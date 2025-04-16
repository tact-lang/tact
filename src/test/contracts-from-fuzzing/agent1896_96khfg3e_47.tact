contract OptionalWithDefaults {
    value: Int? = null;
    flag: Bool? = true;
    text: String? = "hi";

    init() {
        self.value = null;
        self.flag = false;
        self.text = "bye";
    }
}