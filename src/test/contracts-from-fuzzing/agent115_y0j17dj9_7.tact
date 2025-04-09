contract OptNested {
    val: Int?;
    val2: String?;
    val3: Bool?;

    init() {
        self.val = 10;
        self.val2 = "opt";
        self.val3 = null;
    }
}