contract OptionalDefault {
    val: Int? = null;

    init() {
        self.val = 5;
    }

    receive() {}
}