contract BadDefaultOptional {
    val: Int? = 5;

    init() {
        self.val = null;
    }
}