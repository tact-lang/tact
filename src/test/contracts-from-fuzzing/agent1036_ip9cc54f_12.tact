contract OptionalDefaultsMix {
    val1: Int? = null;
    val2: Bool? = null;
    val3: Address? = null;
    val4: Int = 5;
    val5: String = "hello";

    init() {
        self.val1 = 15;
        self.val2 = true;
        self.val3 = myAddress();
        self.val4 = 10;
        self.val5 = "world";
    }
}