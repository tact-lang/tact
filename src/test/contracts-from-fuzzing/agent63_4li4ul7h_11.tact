contract ExplicitOptionalFields {
    flag: Bool? = null;
    text: String? = null;
    val: Int? = null;

    init() {
        self.flag = true;
        self.text = "hello";
        self.val = 123;
    }
}
