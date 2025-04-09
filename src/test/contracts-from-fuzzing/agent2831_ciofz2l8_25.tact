contract OptionalStringWithDefault {
    val: String? = "foo";

    init() {
        self.val = null;
    }
}
