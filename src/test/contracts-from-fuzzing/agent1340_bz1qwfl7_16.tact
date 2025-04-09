contract ConstructorOnlyDefaults {
    val1: Int;
    val2: Bool;
    val3: String;

    init() {
        self.val1 = 100;
        self.val2 = true;
        self.val3 = "initialized";
    }
}