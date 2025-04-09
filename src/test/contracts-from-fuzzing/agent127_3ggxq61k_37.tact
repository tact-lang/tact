contract EmptyStringOptionalDefault {
    text: String? = "";

    init() {
        self.text = null;
    }
}