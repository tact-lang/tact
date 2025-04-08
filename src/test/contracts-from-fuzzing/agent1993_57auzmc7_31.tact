contract OptionalOverride {
    val: Int?;

    init() {
        self.val = 5;
        self.val = null;
    }
}