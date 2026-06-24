contract OptionalFields {
    val1: Int?;
    val2: Bool?;
    val3: String?;

    init() {
        self.val1 = 777;
        self.val2 = null;
        self.val3 = "hello";
    }
}
