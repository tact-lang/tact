contract OptionalAndDefault {
    val1: Int?;
    val2: Int = 42;
    val3: Bool?;
    val4: Bool = true;

    init() {
        self.val1 = null;
        self.val2 = 100;
        self.val3 = false;
        self.val4 = false;
    }
}
