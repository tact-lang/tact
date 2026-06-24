contract OptionalStructField {
    val: Int?;

    init() {
        self.val = 10;
        self.val = null;
    }
}