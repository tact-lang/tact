contract OptionalPrimInit {
    val1: Int?;
    val2: Address?;

    init() {
        self.val1 = null;
        self.val2 = null;
    }
}