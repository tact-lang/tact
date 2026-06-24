contract InitDefaultsConflict {
    val1: Int = 1;
    val2: Int;

    init() {
        self.val2 = 5;
    }
}