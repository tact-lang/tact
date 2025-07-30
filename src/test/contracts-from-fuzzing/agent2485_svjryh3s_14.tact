contract ExplicitNullOptional {
    val1: Int?;
    val2: Bool?;
    text: String?;

    init() {
        self.val1 = null;
        self.val2 = null;
        self.text = null;
    }
}