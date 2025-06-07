contract InitOverrideField {
    val: Int = 5;

    init() {
        self.val = 10;
    }
}