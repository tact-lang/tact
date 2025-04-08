contract AlternatingTypesContract {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Int?;
    val5: Bool?;
    val6: String?;

    init() {
        self.val1 = 42;
        self.val2 = true;
        self.val3 = "test";
        self.val4 = null;
        self.val5 = false;
        self.val6 = null;
    }
}